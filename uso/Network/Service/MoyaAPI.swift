//
//  MoyaAPI.swift
//  uso
//
//  Created by 서재훈 on 2020/06/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import Moya

//임시 토큰
let token = "eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjYsImlhdCI6MTU5MTI3MDY5OH0.MbIVXMzgjLlPAuJYMs4bQX6vKx7AAQmVS94t0btd4lGO3WqudB4fPsedN9ynLbxk"

enum MoyaAPI {
    case getHabits(query: Int)
    case fetchRanking
}

extension MoyaAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://habitbread.tk")!
    }
    
    var path: String {
        switch self {
        case .getHabits(let query):
            return "/users/\(query)/habits"
        case .fetchRanking:
            return "/users"
            //return "/ranking"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        switch self {
        case .getHabits:
            return .requestPlain
        case .fetchRanking:
            return .requestPlain
//            return .requestParameters(parameters: ["q" : query], encoding: URLEncoding.default)
        }
    }
    
    var validationType: Moya.ValidationType {
        return .successAndRedirectCodes
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer "+token]
    }
}
