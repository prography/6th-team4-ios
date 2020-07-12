//
//  Habit.swift
//  uso
//
//  Created by Apple on 2020/05/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

struct ResonseHabitList: Decodable {
    let habit           : [Habit]?
    
    enum CodingKeys: String, CodingKey {
        case habit = "Habit"
    }
}

struct Habit: Decodable {
    let habitID         : Int
    let userID          : Int
    let title           : String
    let description     : String
    let category        : String
}

struct NewHabit: Decodable {
    let title           : String
    let category        : String
    let description     : String?
    let dayOfWeek       : String
    let alarmTime       : String?
}
