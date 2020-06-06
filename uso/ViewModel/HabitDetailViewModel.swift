//
//  HabitDetailViewModel.swift
//  uso
//
//  Created by sooyong on 2020/06/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HabitDetailViewBindable: ViewBindable {
}

class HabitDetailViewModel: HabitDetailViewBindable {
    // Abstraction of VC
    // ViewModel should be one for a VC in this project
    let bag = DisposeBag()
    
    init() {
        
    }
    
    // Bind UseCase
    // It would be excuted from coordinator
    func bind(usecase: RootUseCaseProtocol) {
    }
}
