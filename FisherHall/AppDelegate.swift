//
//  AppDelegate.swift
//  FisherHallClient
//
//  Created by Amos Chan on 2016-11-03.
//  Copyright © 2016 Amos Chan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppCoordinatorDelegate {
	var window: UIWindow?
	var coordinator: AppCoordinator?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		coordinator = AppCoordinator(delegate: self)
		coordinator?.start()

		return true
	}

	func didCreateRootViewController(_ controller: UIViewController) {
		guard let window = self.window else { return }
		window.rootViewController = controller
		window.makeKeyAndVisible()
	}
}
