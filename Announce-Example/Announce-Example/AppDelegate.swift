//
//  AppDelegate.swift
//  Announce-Example
//
//  Created by Vitor Travain on 5/23/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let vc = ViewController()
        let navigation = UINavigationController(rootViewController: vc)

        window?.rootViewController = navigation
        window?.makeKeyAndVisible()

        return true
    }
}

