//
//  Task.swift
//  FinalPoc
//
//  Created by Elias Paulino on 29/08/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import Foundation

typealias Time = (minutes: Int, secs: Int)

struct Task {
    var name: String
    var spendTime: Time
    
    mutating func increasingSec() {
        let spendSec = self.seconds - 1
        spendTime.minutes = Int(spendSec / 60)
        spendTime.secs = Int((spendSec) - (spendTime.minutes * 60))
    }
    
    var seconds: Int {
        return spendTime.minutes * 60 + spendTime.secs
    }
}
