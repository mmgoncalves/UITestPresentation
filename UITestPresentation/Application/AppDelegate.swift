//
//  AppDelegate.swift
//  UITestPresentation
//
//  Created by Mateus Marques on 17/01/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let frame = UIScreen.main.bounds
		window = UIWindow(frame: frame)
		window?.makeKeyAndVisible()
		
		window?.rootViewController = MainTabBar()
		return true
	}
}
