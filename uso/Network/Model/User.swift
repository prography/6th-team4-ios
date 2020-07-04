//
//  User.swift
//  uso
//
//  Created by 서재훈 on 2020/06/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

struct UserItem: Decodable {
    var userId: Int?
    var name: String?
    var exp: Int?
    var createdAt: String?
    var updatedAt: String?
    var level: Int?
    var levelPercent: Int?
    
    init() {
        userId = 0
        name = "name"
        exp = 0
        createdAt = ""
        updatedAt = ""
        level = 0
        levelPercent = 0
    }
}
