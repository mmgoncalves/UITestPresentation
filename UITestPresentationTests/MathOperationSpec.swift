//
//  MathOperationSpec.swift
//  UITestPresentationTests
//
//  Created by m.marques.goncalves on 20/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import XCTest
@testable import UITestPresentation

final class MathOperationSpec: XCTestCase {

  var sut: MathOperation!

  override func setUp() {
    sut = MathOperation()
  }

  override func tearDown() {

  }

  func testSum() {
    let op = OperationType.sum
    let value1 = 1.0
    let value2 = 1.0
    XCTAssert(sut.result(operation: op, value1: value1, value2: value2) == 2.0)
  }

  func testDivision() {
    let op = OperationType.division
    let value1 = 10.0
    let value2 = 2.0
    XCTAssert(sut.result(operation: op, value1: value1, value2: value2) == 5.0)
  }

  func testSubtraction() {
    let op = OperationType.subtraction
    let value1 = 3.0
    let value2 = 1.0
    XCTAssert(sut.result(operation: op, value1: value1, value2: value2) == 2.0)
  }

  func testMultiplication() {
    let op = OperationType.multiplication
    let value1 = 2.0
    let value2 = 2.0
    XCTAssert(sut.result(operation: op, value1: value1, value2: value2) == 4.0)
  }
}
