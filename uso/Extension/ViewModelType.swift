//
//  ViewModelType.swift
//  uso
//
//  Created by 서재훈 on 2020/06/27.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

enum ViewModelExecution {
    case trigger
}
