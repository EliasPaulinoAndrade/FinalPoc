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

        let parentController = UIViewController()
        let firstResponder = UINavigationController(rootViewController: AddTaskViewController())
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            DispatchQueue.main.async {
                parentController.present(firstResponder, animated: true, completion: nil)
            }
        }
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = parentController
        
        window?.makeKeyAndVisible()

        return true
    }
}

