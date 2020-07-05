//
//  MainCoordinator.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        // Bind relationship between VC, ViewModel, and UseCase
        let viewModel = SignViewModel.init()
        viewModel.bind(usecase: RootUseCase())
        let viewController = SignViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.coordinator = self
        
        // Navigate VC
        viewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func presentMainTabVC() {
        navigationController.navigationBar.isHidden = true
        let viewController = MainTabViewController.instantiate()
        viewController.coordinator = self
        
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationController.navigationItem.leftBarButtonItem = backButton
        
        navigationController.popViewController(animated: false)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentHabitAddVC() {
        let viewController = HabitAddViewController.instantiate()
        viewController.coordinator = self
        // Consider animation for modal push
        navigationController.navigationBar.isHidden = true
        navigationController.present(viewController, animated: true)
    }

    func presentBakeryVC() {
        let viewController = BakeryViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentHabitDetailVC() {
        let viewController = HabitDetailViewController.instantiate()
        viewController.coordinator = self
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(viewController, animated: true)
    }
}
