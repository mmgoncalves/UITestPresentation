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
	
	func testSum() {
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
	
	func testDiv() {
		app.launch()
		let value1TextField = app.textFields["value1TextField"]
		value1TextField.tap()
		value1TextField.typeText("10")
		
		let value2TextField = app.textFields["value2TextField"]
		value2TextField.tap()
		value2TextField.typeText("2")
		
		let opButton = app.buttons["op_/"]
		opButton.tap()
		
		let symbol = app.staticTexts["/"]
		XCTAssert(symbol.exists)
		
		let calcButton = app.buttons["button"]
		calcButton.tap()
		
		let result = app.staticTexts["5.0"]
		XCTAssert(result.exists)
	}
	
	func testSub() {
		app.launch()
		let value1TextField = app.textFields["value1TextField"]
		value1TextField.tap()
		value1TextField.typeText("2")
		
		let value2TextField = app.textFields["value2TextField"]
		value2TextField.tap()
		value2TextField.typeText("1")
		
		let opButton = app.buttons["op_-"]
		opButton.tap()
		
		let symbol = app.staticTexts["-"]
		XCTAssert(symbol.exists)
		
		let calcButton = app.buttons["button"]
		calcButton.tap()
		
		let result = app.staticTexts["1.0"]
		XCTAssert(result.exists)
	}
	
	func testMult() {
		app.launch()
		let value1TextField = app.textFields["value1TextField"]
		value1TextField.tap()
		value1TextField.typeText("2")
		
		let value2TextField = app.textFields["value2TextField"]
		value2TextField.tap()
		value2TextField.typeText("2")
		
		let opButton = app.buttons["op_*"]
		opButton.tap()
		
		let symbol = app.staticTexts["*"]
		XCTAssert(symbol.exists)
		
		let calcButton = app.buttons["button"]
		calcButton.tap()
		
		let result = app.staticTexts["4.0"]
		XCTAssert(result.exists)
	}
	
	func testFailure() {
		app.launch()
		
		let calcButton = app.buttons["button"]
		calcButton.tap()
		
		let alert = app.alerts
		XCTAssert(alert.count == 1)
		
		let errorText = alert.staticTexts["Escolha a operação que deseja realiar"]
		XCTAssert(errorText.exists)
	}
}
