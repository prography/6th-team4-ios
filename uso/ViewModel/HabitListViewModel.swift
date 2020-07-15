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
    var habitList: BehaviorSubject<[Any]> { get }
    var profile: BehaviorSubject<[Any]> { get }
    func fetch()
}

class HabitListViewModel: HabitListViewBindable {
    
    var isLoading: PublishSubject<Bool>
    var responseStatus: PublishSubject<ResponseStatus>
    var habitList: BehaviorSubject<[Any]>
    var profile: BehaviorSubject<[Any]>
    
    init() {
        isLoading = PublishSubject.init()
        responseStatus = PublishSubject.init()
        habitList = BehaviorSubject.init(value: [HabitItem(name: "Sleep at 12am", ratio: 88, contributions: [0, 1, 2, 3, 4, 2]),HabitItem(name: "Work out!", ratio: 62, contributions: [3, 1, 1, 3, 4, 2])])
        profile = BehaviorSubject.init(value: [Profile(description: "You should do  workout today!!")])
    }
    
    func fetch() {
        self.isLoading.onNext(true)
        // input usecase which make api call for this viewModel data
        self.isLoading.onNext(false)
        self.responseStatus.onNext(.success)
    }
    
    func bindUseCase(usecase: HabitListUseCaseProtocol) {}
}

struct Profile {
    var description: String
}
