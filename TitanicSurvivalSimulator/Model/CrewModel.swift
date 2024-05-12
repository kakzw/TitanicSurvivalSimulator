//
//  CrewModel.swift
//  TitanicSurvivalSimulator
//
//  Created by Kento Akazawa on 5/10/24.
//

import SwiftUI

class CrewModel {
  private let maleTotal = 885
  private let maleSurvived = 192
  private let femaleTotal = 23
  private let femaleSurvived = 20
  
  // returns survival chance based on sex for crew
  func predict(sex: Sex) -> Float {
    switch sex {
    case .f:
      return Float(femaleSurvived) / Float(femaleTotal)
    case .m:
      return Float(maleSurvived) / Float(maleTotal)
    }
  }
}
