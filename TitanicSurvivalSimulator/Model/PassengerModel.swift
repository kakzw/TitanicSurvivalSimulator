//
//  PassengerModel.swift
//  TitanicSurvivalSimulator
//
//  Created by Kento Akazawa on 5/1/24.
//

import SwiftUI
import TensorFlowLite

class PassengerModel {
  private let interpreter: Interpreter
  private let norm = Normalization()
  
  // MARK: - Initialization
  
  init(modelPath: String) {
    do {
      // Load the TensorFlow Lite model
      interpreter = try Interpreter(modelPath: modelPath)
      try interpreter.allocateTensors()
    } catch {
      fatalError("Failed to load model with error: \(error.localizedDescription)")
    }
  }
  
  // MARK: - Public Functions
  
  // convert all attributes to float and normalize
  func preprocessInput(passengerClass: PassengerClass, sex: Sex, age: Int, numOfSiblings: Int, numOfParents: Int, fare: String, embarked: Port) -> [Float32] {
    let passengerClassVal = norm.normalize(Float(passengerClass.rawValue), meanStdDev: norm.passengerClass)
    let sexVal = norm.normalize(sex.val, meanStdDev: norm.sex)
    let ageVal = norm.normalize(Float(age), meanStdDev: norm.age)
    let numOfSiblingsVal = norm.normalize(Float(numOfSiblings), meanStdDev: norm.numOfSiblings)
    let numOfParentsVal = norm.normalize(Float(numOfParents), meanStdDev: norm.numOfParents)
    let fareVal = norm.normalize(Float(fare) ?? 0.0, meanStdDev: norm.fare)
    let embarkedVal = norm.normalizePort(embarked)
    let inputData = embarkedVal + [passengerClassVal, sexVal, ageVal, numOfSiblingsVal, numOfParentsVal, fareVal]
    return inputData.map { Float32($0) }
  }
  
  // returns the survival chance based on provided details
  func predict(passengerClass: PassengerClass, sex: Sex, age: Int, numOfSiblings: Int, numOfParents: Int, fare: String, embarked: Port) -> Float {
    let input = preprocessInput(passengerClass: passengerClass, sex: sex, age: age, numOfSiblings: numOfSiblings, numOfParents: numOfParents, fare: fare, embarked: embarked)
    
    guard (try? interpreter.input(at: 0)) != nil else {
      fatalError("Failed to get input tensor")
    }
    
    let inputData = Data(buffer: UnsafeBufferPointer(start: input, count: input.count))
    
    do {
      try interpreter.copy(inputData, toInputAt: 0)
    } catch {
      fatalError("Failed to copy input data \(error.localizedDescription)")
    }
    
    // invoke the interpreter
    do {
      try interpreter.invoke()
    } catch {
      fatalError("Failed to invoke interpreter with error: \(error.localizedDescription)")
    }
    
    guard let outputTensor = try? interpreter.output(at: 0) else {
      fatalError("Failed to get output tensor")
    }
    
    // get the prediction result from the output tensor
    guard let outputData = outputTensor.data.toArray(type: Float32.self) else {
      fatalError("Failed to convert output tensor data to array of Float32")
    }
    
    // assuming the output tensor has a single value (binary classification)
    return outputData.first ?? 0.0
  }
}

extension Data {
  func toArray<T>(type: T.Type) -> [T]? {
    guard count > 0 else { return nil }
    return withUnsafeBytes { (rawBufferPointer) -> [T] in
      Array(UnsafeBufferPointer<T>(start: rawBufferPointer.baseAddress!.assumingMemoryBound(to: T.self), count: count/MemoryLayout<T>.stride))
    }
  }
}
