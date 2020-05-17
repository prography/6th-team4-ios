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


struct HabitID {}
struct ErrorLog {}

enum HabitAPI {
    case getTotalHabit
    case registerHabit(_ comp: Habit)
    case getSpecHabit(_ comp: HabitID)
    case modifyHabit(_ comp: HabitID)
    case deleteHabit(_ comp: HabitID)
    // Error Log
    case sendErrorLog(_ components: ErrorLog)
}

extension HabitAPI: TargetType {
    var baseURL: URL {
        return NSURL(string: "http://localohst:3000")! as URL
    }
    
    var path: String {
        var path: String {
            switch self {
            case .getTotalHabit: return "pets"
            case .registerHabit( _): return "pets1"
            case .getSpecHabit( _): return "pets2"
            case .modifyHabit( _): return "pets3"
            case .deleteHabit( _): return "pets4"
            case .sendErrorLog: return "inspection-error-log"
            }
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTotalHabit: return .get
        case .registerHabit(let _): return .post
        case .getSpecHabit(let _): return .get
        case .modifyHabit(let _): return .put
        case .deleteHabit(let _): return .delete
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        case .registerHabit(let habit): return .requestJSONEncodable(_)
        case .getSpecHabit(let habitID): return .requestJSONEncodable(_)
        case .modifyHabit(let habitID): return .requestJSONEncodable(comp)
        case .deleteHabit(let habitID): return .requestJSONEncodable(comp)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
// default alamofire manager를 만들어줘야함!
struct HabitService {
    static let provider = MoyaProvider<HabitAPI>(manager: DefaultAlamofireManager.sharedManager,
    plugins: [AccessTokenPlugin { Token.current },
              activiyPlugIn])
    
    static func getHabitList(_ comp: HabitID,
                                  _ completion: @escaping (Habit) -> Void) {
        provider.request(.getInspectionLists(comp)) { (response) in
            switch response.result {
            case .success(let value):
                if let data = try? value.map(ResponseInspection.self) {
                    DispatchQueue.main.async {
                        completion(data)
                    }
                }
            case .failure(let error):
                print("error")
            }
        }
    }
}
