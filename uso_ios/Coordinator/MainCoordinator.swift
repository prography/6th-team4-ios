//
//  MainCoordinator.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import Then

class MainCoordinator: Coordinator {
    // Navigation tree can be structed by using list of child coordinators
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // Bind relationship between VC, ViewModel, and UseCase
        let viewModel = RootViewModel.init()
        viewModel.bind(usecase: RootUseCase())
        let view = RootViewController.instantiate(storyboardName: "RootViewController")
        view.viewModel = viewModel
        view.coordinator = self
        // Navigate VC
        view.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(view, animated: false)
    }
}

