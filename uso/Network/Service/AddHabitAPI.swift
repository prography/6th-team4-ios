//
//  AddHabitAPI.swift
//  uso
//
//  Created by 서재훈 on 2020/07/11.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class AddHabitAPI {
    func getResponse(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    
    static func searchWithSwift(newHabit: NewHabit) {
        moyaProvider.request(.postHabit(newHabit.title, newHabit.category, newHabit.category, newHabit.dayOfWeek, newHabit.alarmTime)) { result in
            switch result {
            case .success(let response):
                handleSuccessResponse(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func handleSuccessResponse(_ response: Response) {
        do {
//            let searchResult = try JSONDecoder().decode(UserItem.self, from: response.data)
//            subject.onNext(searchResult)
            print("성공")
        } catch {
            print(error.localizedDescription)
        }
    }
}

