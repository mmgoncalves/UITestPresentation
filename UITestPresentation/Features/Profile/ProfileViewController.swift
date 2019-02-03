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
//		table.rowHeight = 30
		return table
	}()

	private let items = ["Change username", "Change password"]
	
	init() {
		super.init(nibName: nil, bundle: nil)
		tableView.register(ProfileCell1.self, forCellReuseIdentifier: "profilecell1")
		tableView.register(ProfileCell2.self, forCellReuseIdentifier: "profilecell2")
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		view = tableView
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
//		tableView.reloadData()
	}
}

extension ProfileViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let title = items[indexPath.row]
		
//		if indexPath.row == 0, let cell1 = tableView.dequeueReusableCell(withIdentifier: "profilecell1", for: indexPath) as? ProfileCell1 {
//			cell1.setup(title: title)
//			return cell1
//		}
//
//		if indexPath.row == 1, let cell2 = tableView.dequeueReusableCell(withIdentifier: "profilecell2", for: indexPath) as? ProfileCell2 {
//			cell2.setup(title: title)
//			return cell2
//		}
		
		let cell = UITableViewCell()
		cell.textLabel?.text = title
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
	
//	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		return 30
//	}
}
