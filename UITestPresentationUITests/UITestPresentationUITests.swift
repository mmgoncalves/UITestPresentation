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
		let value1TextField = app.textFields["value1TextField"]
		value1TextField.tap()
		value1TextField.typeText("1")
		
		let value2TextField = app.textFields["value2TextField"]
		value2TextField.tap()
		value2TextField.typeText("2")
		
		let opButton = app.buttons["op_+"]
		opButton.tap()
		
		let symbol = app.staticTexts["+"]
		XCTAssert(symbol.exists)
		
		let calcButton = app.buttons["button"]
		calcButton.tap()
		
		let result = app.staticTexts["3.0"]
		XCTAssert(result.exists)
	}
}
