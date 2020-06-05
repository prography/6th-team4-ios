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
    var userSubject: BehaviorSubject<UserItem> { get }
}

class SettingViewModel: SettingViewBindable {
    // Abstraction of VC
    // ViewModel should be one for a VC in this project
    let bag = DisposeBag()
    let allSettings: Observable<[String]>
    let settingMenus = ["개인 정보 변경", "문의하기", "계정 삭제", "로그아웃"]
    let userSubject: BehaviorSubject<UserItem> = BehaviorSubject<UserItem>(value: UserItem(userId: 0, name: "", exp: 0, createdAt: "", updatedAt: ""))
    
    init() {
        let settings = BehaviorSubject<[String]>(value: settingMenus)
        allSettings = settings
        
        UserAPI.searchWithSwift(userSubject)
    }
    
    // Bind UseCase
    // It would be excuted from coordinator
    func bind(usecase: RootUseCaseProtocol) {
    }
}
