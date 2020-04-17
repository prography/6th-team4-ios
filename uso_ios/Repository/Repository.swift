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
    static let shared = Repository()
    
    
    func fetchRepository(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    private init() { }
}
