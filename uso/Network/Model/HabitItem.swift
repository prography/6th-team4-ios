//
//  HabitList.swift
//  uso
//
//  Created by Apple on 2020/05/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

struct HabitItem {
    var ratio: Int
    var name: String
    var contributions: [Int]
    
    init(name: String, ratio: Int, contributions: [Int]) {
        self.name = name
        self.ratio = ratio
        self.contributions = contributions
    }
}
