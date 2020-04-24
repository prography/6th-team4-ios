//
//  UsoError.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

// define overall errors from Uso app
enum UsoError: Error {
    case networkError
    case decodeError
    case getRepositoryError
    case getValueError
}

