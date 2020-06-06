//
//  Repository.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

protocol RepositoryProtocol {
    func fetchRepository(completion: @escaping (Error?) -> Void)
}

class Repository: RepositoryProtocol {
    // Repository stores core data from api
    // It can be generated for each api
    // Store model structed instance data
    // Generate it with singleton pattern
    static let shared = Repository()
    private init() { }
    // Fetch repository by using api classes
    func fetchRepository(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}
