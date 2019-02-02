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
		let mathViewController = MathViewController()
		mathViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.more, tag: 0)
		viewControllers = [mathViewController]
	}
}
