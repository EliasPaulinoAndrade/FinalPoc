//
//  Task.swift
//  FinalPoc
//
//  Created by Elias Paulino on 29/08/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

typealias Time = (hour: Int, minutes: Int)

struct Task {
    var name: String
    var spendTime: (hour: Int, minutes: Int)
}