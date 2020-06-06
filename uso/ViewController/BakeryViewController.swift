//
//  BakeryViewController.swift
//  uso
//
//  Created by sooyong on 2020/05/16.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BakeryViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    // var viewModel: RankingViewBindable!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension BakeryViewController: Storyboarded {
    
}
