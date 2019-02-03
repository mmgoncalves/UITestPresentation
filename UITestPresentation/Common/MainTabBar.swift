//
//  MainTabBar.swift
//  UITestPresentation
//
//  Created by Mateus Marques on 02/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
	
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	private func setup() {
		let mathItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.featured, tag: 0)
		let mathViewController = MathViewController()
		mathViewController.tabBarItem = mathItem
		
		let profileItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.more, tag: 1)
		let profileViewController = ProfileViewController()
		profileViewController.tabBarItem = profileItem
		let profileNavigation = UINavigationController(rootViewController: profileViewController)
		
		viewControllers = [mathViewController, profileNavigation]
	}
}
