//
//  Enum.swift
//  TitanicSurvivalSimulator
//
//  Created by Kento Akazawa on 5/1/24.
//

import SwiftUI

enum Person: String, CaseIterable {
  case passenger = "Passenger"
  case crew = "Crew"
}

enum PassengerClass: Int, CaseIterable, Identifiable {
  case one = 1
  case two = 2
  case three = 3
  
  var id: Int { self.rawValue }
}

enum Sex: String, CaseIterable, Identifiable {
  case f = "Female"
  case m = "Male"
  
  var id: String { self.rawValue }
  
  var val: Float {
    switch self {
    case .f:
      return 1.0
    case .m:
      return 0.0
    }
  }
}

enum Port: String, CaseIterable, Identifiable {
  case c = "Cherbourg"
  case q = "Queenstown"
  case s = "Southampton"
  
  var id: String { self.rawValue }
  
  var index: Int {
    switch self {
    case .c:
      return 0
    case .q:
      return 1
    case .s:
      return 2
    }
  }
  
  var meanStdDev: MeanStdDev {
    switch self {
    case .c:
      return MeanStdDev(mean: 0.206264, stdDev: 0.404777)
    case .q:
      return MeanStdDev(mean: 0.093965, stdDev: 0.291891)
    case .s:
      return MeanStdDev(mean: 0.698243, stdDev: 0.459196)
    }
  }
}

enum MazeDifficulty {
  case easy
  case medium
}

enum Border {
  case top
  case bottom
  case left
  case right
}

enum Result: String, CaseIterable {
  case result = "Result"
  case maze = "Maze"
}
