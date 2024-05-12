//
//  PassengerModelTests.swift
//  TitanicSurvivalSimulatorTests
//
//  Created by Kento Akazawa on 5/12/24.
//

import XCTest
@testable import TitanicSurvivalSimulator

final class PassengerModelTests: XCTestCase {
  
  private var model: PassengerModel!
  private let annModelPath = Bundle.main.path(forResource: "ann_model", ofType: "tflite")
  
  override func setUpWithError() throws {
    XCTAssertNotNil(annModelPath)
    model = PassengerModel(modelPath: annModelPath!)
  }
  
  override func tearDownWithError() throws {
    model = nil
  }
  
  func testPassengers() {
    for psClass in PassengerClass.allCases {
      for sex in Sex.allCases {
        for port in Port.allCases {
          let res = model.predict(passengerClass: psClass,
                                  sex: sex,
                                  age: Int.random(in: 0...100),
                                  numOfSiblings: Int.random(in: 0...10),
                                  numOfParents: Int.random(in: 0...10),
                                  fare: String(Float.random(in: 0...300)),
                                  embarked: port)
          
          XCTAssertGreaterThan(res, 0)
          XCTAssertLessThan(res, 100)
        }
      }
    }
  }
}
