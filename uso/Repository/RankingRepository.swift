//
//  RankingRepository.swift
//  uso
//
//  Created by 서재훈 on 2020/06/27.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

protocol RankingRepositoryProtocol {
    func fetchRepository(completion: @escaping (Error?) -> Void)
}

class RankingRepository: RankingRepositoryProtocol {
    static let shared = RankingRepository()
    private init() { }
    
    func fetchRepository(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}
