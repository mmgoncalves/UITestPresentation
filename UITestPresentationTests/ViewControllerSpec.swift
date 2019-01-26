//
//  ViewControllerSpec.swift
//  UITestPresentationTests
//
//  Created by m.marques.goncalves on 20/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import XCTest
@testable import UITestPresentation

final class ViewControllerSpec: XCTestCase {

  var sut: ViewController!

  override func setUp() {
    sut = ViewController(nibName: nil, bundle: nil)
	UIApplication.shared.delegate?.window??.rootViewController = sut
  }

  func testOperationButton() {
    let op = OperationType.sum
    let button = OperationButton(operationType: op)
    sut.operationAction(button)
    XCTAssert(sut.currentOperation != nil)
    XCTAssert(sut.currentOperation! == op)
    XCTAssert(sut.symbolLabel.text != nil)
    XCTAssert(sut.symbolLabel.text! == op.rawValue)
  }

  func testMathOperation() {
    let value1 = 10.0
    let value2 = 2.0
    sut.value1TextField.text = "\(value1)"
    sut.value2TextField.text = "\(value2)"

    let op = OperationType.division
    sut.currentOperation = op
    sut.action()
    XCTAssert(sut.resultLabel.text != nil)
    XCTAssert(sut.resultLabel.text! == "5.0")
  }

  func testMathOperationFailed() {
    let op = OperationType.division
    sut.currentOperation = op
    sut.action()
    XCTAssert(sut.errorAlert.isBeingPresented)
  }
}
