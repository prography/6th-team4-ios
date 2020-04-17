//
//  ViewController.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bind(viewModel: RootViewModel())
        layout()
    }
    
    private func bind(viewModel: RootViewBindable) {
        
    }
    
    private func layout() {
        
    }
}

//MARK: Detail func definition of VC
extension RootViewController: Storyboarded  {
    
}
