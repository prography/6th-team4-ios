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
    
}

class HabitListViewModel: HabitListViewBindable {
    // Abstraction of VC
    // ViewModel should be one for a VC in this project
    
    init() {
        
    }
    
    // Bind UseCase
    // It would be excuted from coordinator
    func bind(usecase: RootUseCaseProtocol) {
        
    }
}

