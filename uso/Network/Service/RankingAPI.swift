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

class RankingAPI {
    func getResponse(completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    
    static func searchWithSwift(_ subject: PublishSubject<[RankingItem]>) {
        moyaProvider.request(.fetchRanking) { result in
            switch result {
            case .success(let response):
                handleSuccessResponse(response, subject)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func handleSuccessResponse(_ response: Response, _ subject: PublishSubject<[RankingItem]>) {
        do {
            let searchResult = try JSONDecoder().decode(RankingItems.self, from: response.data)
            guard var user = searchResult.user else { return }
            user.achievement = searchResult.userTotalCount
            var rankings = searchResult.rankings
            rankings.insert(user, at: 0)
            subject.onNext(rankings)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
