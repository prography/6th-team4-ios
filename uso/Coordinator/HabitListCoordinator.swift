//
//  TabCoordinator.swift
//  uso_ios
//
//  Created by Apple on 2020/04/28.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class HabitListCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = HabitListViewController.instantiate()
        viewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(viewController, animated: true)
    }
}
