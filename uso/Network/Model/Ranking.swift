//
//  Ranking.swift
//  uso
//
//  Created by 서재훈 on 2020/06/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

struct RankingItems: Decodable {
    let user: RankingItem?
    let userTotalCount: Int
    let rankings: [RankingItem]
}

struct RankingItem: Decodable {
    var userId: Int
    var userName: String
    var exp: Int
    var achievement: Int
    var rank: String

    init(_ item: Model) {
        userId = 0
        userName = item.data ?? "nickName"
        exp = 0
        achievement = 0
        rank = "0"
    }

    init(userId: Int, userName: String, exp: Int, achievement: Int, rank: String) {
        self.userId = userId
        self.userName = userName
        self.exp = exp
        self.achievement = achievement
        self.rank = rank
    }
}

extension RankingItem: Equatable {
    static func == (lhs: RankingItem, rhs: RankingItem) -> Bool {
        return lhs.rank == rhs.rank && lhs.userName == rhs.userName
    }
}
