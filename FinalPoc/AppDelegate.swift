//
//  AppDelegate.swift
//  FinalPoc
//
//  Created by Elias Paulino on 29/08/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let firstResponder = AddTaskViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = firstResponder
        
        window?.makeKeyAndVisible()

        return true
    }
}

