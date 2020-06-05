//
//  SettingViewModel.swift
//  uso_ios
//
//  Created by Apple on 2020/04/28.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SettingViewBindable: ViewBindable {
    var allSettings: Observable<[String]> { get }
}

class SettingViewModel: SettingViewBindable {
    // Abstraction of VC
    // ViewModel should be one for a VC in this project
    let bag = DisposeBag()
    let allSettings: Observable<[String]>
    
    init() {
        let settings = BehaviorSubject<[String]>(value: ["1", "2"])
        allSettings = settings
    }
    
    // Bind UseCase
    // It would be excuted from coordinator
    func bind(usecase: RootUseCaseProtocol) {
    }
}
