//
//  HabitAddRepsitory.swift
//  uso
//
//  Created by sooyong on 2020/05/16.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

protocol HabitAddRepositoryProtocol {
    func fetchRepository(completion: @escaping (Error?) -> Void)
}

class HabitAddRepository: HabitAddRepositoryProtocol {
    static let shared = HabitAddRepository()
    private init() { }
    // Fetch repository by using api classes
    func fetchRepository(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}

