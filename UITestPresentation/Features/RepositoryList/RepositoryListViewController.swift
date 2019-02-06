//
//  RepositoryListViewController.swift
//  UITestPresentation
//
//  Created by m.marques.goncalves on 06/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

final class RepositoryListViewController: UIViewController {

  private(set) lazy var tableView: UITableView = {
    let table = UITableView()

    return table
  }()

  init(webservice: WebserviceProtocol) {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

protocol WebserviceProtocol: AnyObject {
  func request() -> RepoModel
}

struct RepoModel: Codable {
  let total: Int
}
