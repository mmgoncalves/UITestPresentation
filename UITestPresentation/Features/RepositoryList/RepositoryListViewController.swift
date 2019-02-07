//
//  RepositoryListViewController.swift
//  UITestPresentation
//
//  Created by m.marques.goncalves on 06/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

final class RepositoryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  private(set) lazy var tableView: UITableView = {
    let table = UITableView()
    table.delegate = self
    table.dataSource = self
    table.separatorStyle = .none
    table.accessibilityIdentifier = "RepositoryListViewController"
    return table
  }()

  private lazy var activity: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .gray)
    indicator.hidesWhenStopped = true
    return indicator
  }()

  private let webservice: WebserviceProtocol
  private var items: [RepoModel] = []

  init(webservice: WebserviceProtocol = Webservice()) {
    self.webservice = webservice
    super.init(nibName: nil, bundle: nil)
    tableView.register(RepoCell.self, forCellReuseIdentifier: "cell")
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view = tableView
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if items.count == 0 {
      startLoading()
      webservice.request { result in
        switch result {
        case .success(let data):
          let item = try! JSONDecoder().decode(Item.self, from: data)

          self.items = item.items
          self.tableView.reloadData()
          self.stopLoading()
        case .error(let error):
          fatalError(error.localizedDescription)
        }
      }
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let repo = items[indexPath.row]
    cell.textLabel?.text = repo.name
    cell.detailTextLabel?.text = "Forks: \(repo.forks)"
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
  }

  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let alertAction = UITableViewRowAction(style: .normal, title: "Number of Stars") { (action, indexPath) in
      let repo = self.items[indexPath.row]

      let alertCtrl = UIAlertController(title: "\(repo.stars) stars", message: "", preferredStyle: .alert)
      let cancelAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
      alertCtrl.addAction(cancelAction)

      self.present(alertCtrl, animated: true, completion: nil)
    }

    return [alertAction]
  }

  private func startLoading() {
    view.addSubview(activity)
    activity.startAnimating()
    activity.center = view.center
    NSLayoutConstraint.activate([
      activity.heightAnchor.constraint(equalToConstant: 90),
      activity.widthAnchor.constraint(equalToConstant: 90)
      ])
  }

  private func stopLoading() {
    activity.stopAnimating()
    activity.removeFromSuperview()
  }
}

class RepoCell: UITableViewCell {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
