//
//  UITestPresentationTests.swift
//  UITestPresentationTests
//
//  Created by Mateus Marques on 17/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import XCTest
@testable import UITestPresentation

class UITestPresentationTests: XCTestCase {

	var sut: ViewController!
	
    override func setUp() {
        sut = ViewController(nibName: nil, bundle: nil)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testChangeTitle() {
		sut.titleTextField.text = "test"
		sut.action()
		XCTAssert(sut.titleLabel.text == "test")
	}

}
