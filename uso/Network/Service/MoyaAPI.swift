//
//  MoyaAPI.swift
//  uso
//
//  Created by 서재훈 on 2020/06/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import Moya
import RxSwift

//임시 토큰
let token = "eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsImlhdCI6MTU5MTg4MDg3NX0.43cddF2LE7YmhNYAC5uWCNKUgE28RaZ49ZTm9erXhsO_s41cXkHaKUP1OU78jbcn"

let moyaProvider = MoyaProvider<MoyaAPI>()

enum MoyaAPI {
    case getHabits(query: Int)
    case fetchRanking
    case fetchSetting
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
            return "/ranking"
        case .fetchSetting:
            return "/users"
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
            //            return .requestParameters(parameters: ["q" : query], encoding: URLEncoding.default)
        case .fetchRanking:
            return .requestPlain
        case .fetchSetting:
            return .requestPlain
        }
    }
    
    var validationType: Moya.ValidationType {
        return .successAndRedirectCodes
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer "+token]
    }
}
