//
//  ProfileViewController.swift
//  UITestPresentation
//
//  Created by Mateus Marques on 03/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	
	// MARK: - Properties -
	private(set) lazy var tableView: UITableView = {
		let table = UITableView()
		table.delegate = self
		table.dataSource = self
		table.separatorStyle = .none
    table.accessibilityIdentifier = "ProfileViewController"
		return table
	}()

  typealias Item = (key: String, value: String)

  private let items: [Item] = [
    (key: "changeUsername", value: "Change username"),
    (key: "changePassword", value: "Change password")
    ]
	
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		view = tableView
	}
}

extension ProfileViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = items[indexPath.row]

		let cell = UITableViewCell()
		cell.textLabel?.text = item.value
    cell.accessibilityIdentifier = item.key
		return cell
	}
}

extension ProfileViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == 0 {
			let changeUsernameVC = ChangeUsernameViewController()
			navigationController?.pushViewController(changeUsernameVC, animated: true)
		}
		
		if indexPath.row == 1 {
			let changePasswordVC = ChangePasswordViewController()
			navigationController?.pushViewController(changePasswordVC, animated: true)
		}
	}
}
