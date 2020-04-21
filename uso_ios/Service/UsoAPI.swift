//
//  UsoAPI.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

import Foundation

protocol UsoAPIProtocol {
    func getResponse(completion: @escaping (Error?)-> Void)
}

class UsoAPI: UsoAPIProtocol {
    // API for getting data or posting data
    func getResponse(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}
