//
//  UseCase.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

protocol RootUseCaseProtocol {
}

class RootUseCase: RootUseCaseProtocol {
    init() {
        // Manage data which occurs dependencies between repositories
        // Usecase is defined for each ViewModel
    }
}
