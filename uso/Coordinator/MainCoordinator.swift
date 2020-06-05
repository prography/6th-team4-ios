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
        let viewController = MainTabViewController.instantiate()
        
        // Create Tab one
        let tabOne = HabitListViewController.instantiate()
        let habitListViewModel = HabitListViewModel.init()
        let tabOneBarItem1 = UITabBarItem(title: "Habit", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        tabOne.modalPresentationStyle = .fullScreen
        tabOne.coordinator = self
        tabOne.viewModel = habitListViewModel
        tabOne.tabBarItem = tabOneBarItem1
        
        // Create Tab two
        let tabTwo = RankingViewController.instantiate()
        let tabTwoBarItem2 = UITabBarItem(title: "Ranking", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        let rankingViewModel = RankingViewModel.init()
        rankingViewModel.bind(usecase: RankingUseCase())
        tabTwo.viewModel = rankingViewModel
        tabTwo.coordinator = self
        tabTwo.modalPresentationStyle = .fullScreen
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab three
        let tabThree = SettingViewController.instantiate()
        let tabTwoBarItem3 = UITabBarItem(title: "Setting", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        //테스트
        let settingViewModel = SettingViewModel.init()
        settingViewModel.bind(usecase: RootUseCase())
        tabThree.viewModel = settingViewModel
        
        tabThree.modalPresentationStyle = .fullScreen
        tabThree.tabBarItem = tabTwoBarItem3
        
        viewController.viewControllers = [tabOne, tabTwo, tabThree]
        viewController.selectedIndex = 0
        viewController.coordinator = self
        
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.isHidden = false
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationController.navigationItem.leftBarButtonItem = backButton
        
        navigationController.popViewController(animated: false)
        navigationController.pushViewController(viewController, animated: true)
    }
    func presentHabitAddVC() {
        print("get in to")
        let viewController = HabitAddViewController.instantiate()
        viewController.coordinator = self
        // Consider animation for modal push
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentBakeryVC() {
        let viewController = BakeryViewController.instantiate()
        viewController.coordinator = self
        // Consider animation for modal push
        navigationController.pushViewController(viewController, animated: true)
    }
}
