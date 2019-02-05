//
//  KIFTarget.swift
//  KIFTarget
//
//  Created by Mateus Marques on 04/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//
import UIKit
import XCTest
@testable import UITestPresentation

class KIFTarget: XCTestCase {

	var sut: ProfileViewController!
	var window: UIWindow!
	
    override func setUp() {
		window = UIWindow(frame: UIScreen.main.bounds)
		window.makeKeyAndVisible()
		sut = ProfileViewController()
		
		window.rootViewController = sut
    }

    override func tearDown() {
		
    }

    func testExample() {
		tester().tapRow(at: IndexPath(row: 0, section: 0), in: sut.tableView)
//		tester().waitForView(withAccessibilityLabel: "Change username")
    }

}

extension XCTestCase {
	func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
		return KIFUITestActor(inFile: file, atLine: line, delegate: self)
	}
	
	func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
		return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
	}
}

extension KIFTestActor {
	func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
		return KIFUITestActor(inFile: file, atLine: line, delegate: self)
	}
	
	func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
		return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
	}
}
