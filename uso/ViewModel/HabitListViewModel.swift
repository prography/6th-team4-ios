//
//  HabitListViewModel.swift
//  uso_ios
//
//  Created by Apple on 2020/04/28.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HabitListViewBindable: ViewBindable {
    var isLoading: PublishSubject<Bool> { get }
    var responseStatus: PublishSubject<ResponseStatus> { get }
    var habitList: BehaviorSubject<HabitList> { get }
    func fetch()
}

class HabitListViewModel: HabitListViewBindable {
    var isLoading: PublishSubject<Bool>
    var responseStatus: PublishSubject<ResponseStatus>
    var habitList: BehaviorSubject<HabitList>
    
    init() {
        isLoading = PublishSubject.init()
        responseStatus = PublishSubject.init()
        habitList = BehaviorSubject.init(value: HabitList())
    }
    
    
    func fetch() {
        self.isLoading.onNext(true)
        // input usecase which make api call for this viewModel data
        self.isLoading.onNext(false)
        self.responseStatus.onNext(.success)
    }
    
    func bind(usecase: HabitListUseCaseProtocol) {}
}
