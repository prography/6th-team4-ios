//
//  MainCoordinator.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import Foundation

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.modalPresentationStyle = .fullScreen
    }
    
    func start() {
        let view = RootViewController.instantiate(storyboardName: "RootViewController")
        view.coordinator = self
        view.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(view, animated: false)
        
    }
    
}

