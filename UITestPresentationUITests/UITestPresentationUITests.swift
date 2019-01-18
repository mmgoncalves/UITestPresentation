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

//	var sut: ViewController!
	var app: XCUIApplication!
    override func setUp() {
//        sut = ViewController(nibName: nil, bundle: nil)

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
		let text = app.staticTexts["Test"]
		XCTAssert(text.exists)
		
    }

}
