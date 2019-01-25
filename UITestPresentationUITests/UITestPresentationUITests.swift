//
//  UITestPresentationUITests.swift
//  UITestPresentationUITests
//
//  Created by Mateus Marques on 17/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import XCTest
@testable import UITestPresentation

class UITestPresentationUITests: XCTestCase {

	var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {

    }

    func testExample() {
		
		app.launch()
      let titletextfieldTextField = app.textFields["titleTextField"]
      titletextfieldTextField.tap()
    //		titletextfieldTextField.typeText("Test")
      let tKey = app.keys["T"]
      tKey.tap()
      let eKey = app.keys["e"]
      eKey.tap()
      let sKey = app.keys["s"]
      sKey.tap()
      let tKey2 = app.keys["t"]
      tKey2.tap()

      let button = app.buttons["button"]
      button.tap()
      let text = app.staticTexts["Título: Test"]
      XCTAssert(text.exists)
    }
}
