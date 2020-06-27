//
//  UserAPI.swift
//  uso
//
//  Created by 서재훈 on 2020/06/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class UserAPI {
    func getResponse(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    
    static func searchWithSwift(_ subject: BehaviorSubject<UserItem>) {
        moyaProvider.request(.fetchSetting) { result in
            switch result {
            case .success(let response):
                handleSuccessResponse(response, subject)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func handleSuccessResponse(_ response: Response, _ subject: BehaviorSubject<UserItem>) {
        do {
            let searchResult = try JSONDecoder().decode(UserItem.self, from: response.data)
            subject.onNext(searchResult)
        } catch {
            print(error.localizedDescription)
        }
    }
}
