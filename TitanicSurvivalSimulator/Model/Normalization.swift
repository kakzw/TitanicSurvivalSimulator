//
//  Normalization.swift
//  TitanicSurvivalSimulator
//
//  Created by Kento Akazawa on 5/9/24.
//

import SwiftUI

struct MeanStdDev {
  let mean: Float
  let stdDev: Float
}

class Normalization {
  // mean and standard deviation for each attribute
  let passengerClass = MeanStdDev(mean: 2.294882, stdDev: 0.837836)
  let sex = MeanStdDev(mean: 0.355997, stdDev: 0.478997)
  let age = MeanStdDev(mean: 29.881135, stdDev: 14.413500)
  let numOfSiblings = MeanStdDev(mean: 0.498854, stdDev: 1.041658)
  let numOfParents = MeanStdDev(mean: 0.385027, stdDev: 0.865560)
  let fare = MeanStdDev(mean: 33.295479, stdDev: 51.758668)
  
  // MARK: - Public Functions
  
  // normalizes @val using the mean and standard deviation
  func normalize(_ val: Float, meanStdDev: MeanStdDev) -> Float {
    return (val - meanStdDev.mean) / meanStdDev.stdDev
  }
  
  // normalizes port
  // port needs to be converted to matrix since it's categorical variable
  func normalizePort(_ port: Port) -> [Float] {
    var res = [Float]()
    // iterate through all ports
    // and if it matches with @port, the value will be 1 otherwise 0
    // ex. if @port is c, res will be [1,0,0], if @port is q, res will be [0,1,0]
    for p in Port.allCases {
      let val: Float = port == p ? 1.0 : 0.0
      res.append(normalize(val, meanStdDev: p.meanStdDev))
    }
    return res
  }
}
