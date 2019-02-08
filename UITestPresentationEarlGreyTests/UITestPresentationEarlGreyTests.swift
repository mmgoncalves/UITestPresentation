//
//  UITestPresentationEarlGreyTests.swift
//  UITestPresentationEarlGreyTests
//
//  Created by m.marques.goncalves on 08/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import XCTest
import EarlGrey
@testable import UITestPresentation

class UITestPresentationEarlGreyTests: XCTestCase {

  var sut: RepositoryListViewController!
  var fakeWebservice: FakeWebservice!

    override func setUp() {
      fakeWebservice = FakeWebservice()
      sut = RepositoryListViewController(webservice: fakeWebservice)
      UIApplication.shared.keyWindow?.rootViewController = sut
      UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }

  func testPresenceOfKeyWindow() {
    EarlGrey.selectElement(with: grey_keyWindow()).assert(grey_sufficientlyVisible())
  }

  func testSwipeCell() {
    EarlGrey.selectElement(with: grey_text("item_2"))
      .perform(grey_swipeFastInDirection(.left))

    EarlGrey.selectElement(with: grey_buttonTitle("Number of Stars"))
      .perform(grey_tap())

    EarlGrey.selectElement(with: grey_text("OK"))
      .perform(grey_tap())

    EarlGrey.selectElement(with: grey_text("item_0"))
      .perform(grey_swipeFastInDirection(.left))

    EarlGrey.selectElement(with: grey_buttonTitle("Number of Stars"))
      .perform(grey_tap())

    EarlGrey.selectElement(with: grey_text("OK"))
      .perform(grey_tap())
  }
}

class FakeWebservice: WebserviceProtocol {
  var isSuccess: Bool = true

  func request(completion: @escaping (Result<Data, AppError>) -> Void) {
    if isSuccess {
      let repos = [
        RepoModel(id: 0, name: "item_0", stars: 0, forks: 0),
        RepoModel(id: 1, name: "item_1", stars: 1, forks: 1),
        RepoModel(id: 2, name: "item_2", stars: 2, forks: 2)
      ]
      let itemModel = Item(items: repos)
      let data = try! JSONEncoder().encode(itemModel)
      completion(Result.success(data))
    } else {
      completion(Result.error(AppError.default))
    }
  }
}
