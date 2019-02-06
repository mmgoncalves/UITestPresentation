//
//  ProfileViewControllerSpec.swift
//  UITestPresentationUITests
//
//  Created by m.marques.goncalves on 06/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import XCTest
@testable import UITestPresentation

class ProfileViewControllerSpec: KIFTestCase {

  var sut: ProfileViewController!
  var navigation: UINavigationController!

  override func beforeEach() {
    sut = ProfileViewController()
    navigation = UINavigationController(rootViewController: sut)
    UIApplication.shared.keyWindow?.rootViewController = navigation
    UIApplication.shared.keyWindow?.makeKeyAndVisible()
  }

  func testProfile() {
    tester.waitForView(withAccessibilityIdentifier: "ProfileViewController")
  }

  func testTapOnChangeUsernameRow() {
    tester.tapView(withAccessibilityIdentifier: "changeUsername")
    tester.waitForView(withAccessibilityIdentifier: "changeUsernameScreen")
  }

  func testTapOnChangePasswordRow() {
    tester.tapView(withAccessibilityIdentifier: "changePassword")
    tester.waitForView(withAccessibilityIdentifier: "changePasswordScreen")
  }
}
