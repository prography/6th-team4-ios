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

struct ResponseToken: Decodable {
    let accessToken: String
    let isNewUser: Bool
    
    enum CodingKeys: String, CodingKey {
        case accessToken
        case isNewUser
    }
}

class UserAPI {
    func getResponse(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    
    static func appleLoginRequest(_ user: UserComponent, _ completion: @escaping (ResponseToken?) -> Void) {
        
        moyaProvider.request(.appleLogin(comp: user)) { response in
            
            switch response {
                
            case .success(let value):
                print("done  ", String(decoding: value.data, as: UTF8.self))
                if let result = try? value.map(ResponseToken.self) {
                    
                        completion(result)
                } else {
                    
                    completion(nil)
                }
            case .failure(let error):
                
                print(error.localizedDescription)
            }
        }
    }
    
    static func searchWithSwift(_ subject: BehaviorSubject<[UserItem]>) {
        moyaProvider.request(.fetchSetting) { result in
            switch result {
            case .success(let response):
                handleSuccessResponse(response, subject)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func handleSuccessResponse(_ response: Response, _ subject: BehaviorSubject<[UserItem]>) {
        do {
            let searchResult = try JSONDecoder().decode(UserItem.self, from: response.data)
            var settingMenus = [UserItem("개인 정보 변경"), UserItem("문의하기"), UserItem("계정 삭제"), UserItem("로그아웃")]
            settingMenus.insert(searchResult, at: 0)
            
            subject.onNext(settingMenus)
        } catch {
            print(error.localizedDescription)
        }
    }
}
