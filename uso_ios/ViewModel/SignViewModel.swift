//
//  ViewModel.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SignViewBindable: ViewBindable {
    var number: BehaviorSubject<Int> { get }
}

class SignViewModel: SignViewBindable {
    // Abstraction of VC
    // ViewModel should be one for a VC in this project
    var number: BehaviorSubject<Int>
    
    init() {
        number = BehaviorSubject.init(value: 0)
    }
    
    // Bind UseCase
    // It would be excuted from coordinator
    func bind(usecase: RootUseCaseProtocol) {
        
    }
}
