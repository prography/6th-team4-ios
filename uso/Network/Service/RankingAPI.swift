//
//  UsoAPI.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol RankingAPIProtocol {
    func getResponse(completion: @escaping (Error?) -> Void)
}

class RankingAPI: RankingAPIProtocol {
    // API for getting data or posting data
    var bag = DisposeBag()
    
    func getResponse(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    
    static func searchWithSwift(_ subject: BehaviorSubject<[RankingItem]>) {
        let provider = MoyaProvider<MoyaAPI>()
        provider.request(.fetchRanking) { result in
            switch result {
            case .success(let response):
                handleSuccessResponse(response, subject)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func handleSuccessResponse(_ response: Response, _ subject: BehaviorSubject<[RankingItem]>) {
        do {
            let searchResult = try JSONDecoder().decode(RankingItems.self, from: response.data)
            subject.onNext(searchResult.items)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
