//
//  UINavigationController+init.swift
//  FinalPoc
//
//  Created by Elias Paulino on 02/09/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

extension UINavigationController {
    public convenience init(rootViewController: UIViewController) {
        self.init()
        
        self.viewControllers = [rootViewController]
    }
}
