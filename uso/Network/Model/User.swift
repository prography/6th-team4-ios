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
    var itemTotalCount: Int?
    var percent: Int?
    
    init() {
        userId = 0
        name = "name"
        exp = 0
        createdAt = ""
        updatedAt = ""
        itemTotalCount = 0
        percent = 0
    }
    
    init(_ menu: String) {
        userId = 0
        name = menu
        exp = 0
        createdAt = ""
        updatedAt = ""
        itemTotalCount = 0
        percent = 0
    }
}
