//
//  BakeryRepository.swift
//  uso
//
//  Created by sooyong on 2020/05/16.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

protocol BakeryRepositoryProtocol {
    func fetchRepository(completion: @escaping (Error?) -> Void)
}

class BakeryRepository: BakeryRepositoryProtocol {
    static let shared = BakeryRepository()
    private init() { }
    // Fetch repository by using api classes
    func fetchRepository(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}
