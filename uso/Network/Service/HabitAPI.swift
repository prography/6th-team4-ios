//
//  HabitAPI.swift
//  uso
//
//  Created by sooyong on 2020/05/17.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import Moya
import Alamofire


struct HabitID {
    let userID: String
    let habitID: String
}
struct ErrorLog {}

enum HabitAPI {
    case getTotalHabit(_ comp: HabitID)
    case registerHabit(_ comp: HabitID)
    case getSpecHabit(_ comp: HabitID)
    case modifyHabit(_ comp: HabitID)
    case deleteHabit(_ comp: HabitID)
    case sendErrorLog(_ components: ErrorLog)
}

extension HabitAPI: TargetType {
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        return NSURL(string: "http://49.50.165.80:3000/")! as URL
    }
    
    var path: String {
        var path: String {
            switch self {
            case .getTotalHabit(let comp)                    : return "users/\(comp.userID)/habits"
            case .registerHabit(let comp)       : return "users/\(comp.userID)/habits"
            case .getSpecHabit(let comp)        : return "users/\(comp.userID)/habits/\(comp.habitID)"
            case .modifyHabit(let comp)         : return "users/\(comp.userID)/habits/\(comp.habitID)"
            case .deleteHabit(let comp)         : return "users/\(comp.userID)/habits/\(comp.habitID)"
            case .sendErrorLog                  : return "inspection-error-log" // 이거 어떻게해야할지 생각해보자
            }
        }
    }
    
    /// post get set delete
    var method: Moya.Method {
        switch self {
        case .getTotalHabit      : return .get
        case .registerHabit      : return .post
        case .getSpecHabit       : return .get
        case .modifyHabit        : return .put
        case .deleteHabit        : return .delete
        case .sendErrorLog       : return .post
        }
        var sampleData: Data {
            return Data()
        }
        
    }
    
    struct HabitService {
        // provider 정의하는거랑 moya task 정리하는거 해줘야한다.
        static let provider = MoyaProvider<HabitAPI>()
        
        static func getHabitList(_ comp: HabitID,
                                 _ completion: @escaping (Habit) -> Void) {
            provider.request(.getTotalHabit(comp)) { (response) in
                // 여기 왜 안되지? 
                switch response.result {
                case .success(let value):
                    if let data = try? value.map(ResonseHabitList.self) {
                        completion(data)
                    }
                case .failure(let error):
                    print("error")
                }
            }
        }
    }
}

