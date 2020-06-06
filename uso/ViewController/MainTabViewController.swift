//
//  UIViewController.swift
//  uso_ios
//
//  Created by Apple on 2020/04/28.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Detail func definition of VC
extension MainTabViewController: Storyboarded {
}
