//
//  RankingViewModel.swift
//  uso_ios
//
//  Created by Apple on 2020/04/28.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol RankingViewBindable: ViewBindable {
    var fetchRankings: AnyObserver<Void> { get }
    var allRankings: Observable<[RankingItem]> { get }
}

class RankingViewModel: RankingViewBindable {
    // Abstraction of VC
    // ViewModel should be one for a VC in this project
    let bag = DisposeBag()
    
    let fetchRankings: AnyObserver<Void>
    let allRankings: Observable<[RankingItem]>
    
    init() {
        let fetching = PublishSubject<Void>()
        fetchRankings = fetching.asObserver()
        
//        fetching
//        .
        
        let rankings = BehaviorSubject<[RankingItem]>(value: [
            RankingItem(rank: 17, nickName: "Uso", exp: 0, achieve: 0),
            RankingItem(rank: 1, nickName: "가", exp: 2500, achieve: 2500),
            RankingItem(rank: 2, nickName: "나", exp: 2140, achieve: 2500),
            RankingItem(rank: 200, nickName: "다", exp: 1205, achieve: 2500)])
        
        allRankings = rankings
    }
    
    // Bind UseCase
    // It would be excuted from coordinator
    func bind(usecase: RankingUseCaseProtocol) {
        
    }
}

//임시
struct RankingItem {
    var rank: Int
    var nickName: String
    var exp: Int
    var achieve: Int

    init(_ item: Model) {
        rank = 0
        nickName = item.data ?? "nickName"
        exp = 0
        achieve = 0
    }

    init(rank: Int, nickName: String, exp: Int, achieve: Int) {
        self.rank = rank
        self.nickName = nickName
        self.exp = exp
        self.achieve = achieve
    }
}

extension RankingItem: Equatable {
    static func == (lhs: RankingItem, rhs: RankingItem) -> Bool {
        return lhs.rank == rhs.rank && lhs.nickName == rhs.nickName
    }
}
