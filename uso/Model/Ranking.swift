//
//  Ranking.swift
//  uso
//
//  Created by 서재훈 on 2020/06/03.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

struct RankingItems: Decodable {
    let items: [RankingItem]
}

struct RankingItem: Decodable {
    var rank: Int
    var nickName: String
    var exp: Int
    var achieve: Int

    init(_ item: Model) {
        rank = 0
        nickName = item.data ?? "nickName"
        exp = 0
        achieve = 0
    }

    init(rank: Int, nickName: String, exp: Int, achieve: Int) {
        self.rank = rank
        self.nickName = nickName
        self.exp = exp
        self.achieve = achieve
    }
}

extension RankingItem: Equatable {
    static func == (lhs: RankingItem, rhs: RankingItem) -> Bool {
        return lhs.rank == rhs.rank && lhs.nickName == rhs.nickName
    }
}

//임시 테스트 용
struct UserItem: Decodable {
    var userId: Int?
    var name: String?
    var exp: Int?
    var createdAt: String?
    var updatedAt: String?
}
