//
//  ActivityData.swift
//  BetterLife
//
//  Created by Vicky Zheng on 3/24/19.
//  Copyright © 2019 Vicky Zheng. All rights reserved.
//

import Foundation

struct Event {
    var activity: String
    var weekday: String
}

class ActivityData {
    static let shared = ActivityData()
    
    private init() {}
    
    var allActivities: [Event] = []
}
