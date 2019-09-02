//
//  AddTaskViewControllerDelegate.swift
//  FinalPoc
//
//  Created by Elias Paulino on 02/09/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

protocol AddTaskViewControllerDelegate: AnyObject {
    func taskWasAdd(task: Task)
}
