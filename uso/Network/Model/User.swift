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
}
