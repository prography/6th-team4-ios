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
import Moya

protocol RankingViewBindable: ViewBindable {
    var fetchRankings: AnyObserver<Void> { get }
    var allRankings: Observable<[RankingItem]> { get }
    var rankingSubject: BehaviorSubject<[Any]> { get }
}

class RankingViewModel: RankingViewBindable {
    // Abstraction of VC
    // ViewModel should be one for a VC in this project
    let bag = DisposeBag()
    
    let fetchRankings: AnyObserver<Void>
    let allRankings: Observable<[RankingItem]>
    let rankingSubject: BehaviorSubject<[Any]> = BehaviorSubject<[Any]>(value: [])
    
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
        UsoAPI.searchWithSwift(rankingSubject)
    }
    
    // Bind UseCase
    // It would be excuted from coordinator
    func bind(usecase: RankingUseCaseProtocol) {
        
    }
    
}
