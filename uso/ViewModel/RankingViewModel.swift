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
        
        let rankings = BehaviorSubject<[RankingItem]>(value: [RankingItem(rank: 17, name: "Uso"), RankingItem(rank: 1, name: "가"), RankingItem(rank: 2, name: "나"), RankingItem(rank: 3, name: "다")])
        
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
    var name: String

    init(_ item: Model) {
        rank = 0
        name = item.data ?? "name"
    }

    init(rank: Int, name: String) {
        self.rank = rank
        self.name = name
    }
}

extension RankingItem: Equatable {
    static func == (lhs: RankingItem, rhs: RankingItem) -> Bool {
        return lhs.rank == rhs.rank && lhs.name == rhs.name
    }
}
