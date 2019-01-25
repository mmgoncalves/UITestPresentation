//
//  MathOperation.swift
//  UITestPresentation
//
//  Created by m.marques.goncalves on 19/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import Foundation

struct MathOperation {
  func result(operation: OperationType, value1: Double, value2: Double) -> Double {
    switch operation {
    case .sum:
      return value1 + value2
    case .subtraction:
      return value1 - value2
    case .division:
      return value1 / value2
    case .multiplication:
      return value1 * value2
    }
  }
}

enum OperationType: String, CaseIterable {
  case sum = "+"
  case subtraction = "-"
  case division = "/"
  case multiplication = "*"
}
