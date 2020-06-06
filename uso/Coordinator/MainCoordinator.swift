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
        let rankingViewModel = RankingViewModel.init()
        let tabTwoBarItem2 = UITabBarItem(title: "Ranking", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        tabTwo.modalPresentationStyle = .fullScreen
        tabTwo.coordinator = self
        tabTwo.viewModel = rankingViewModel
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab three
        let tabThree = SettingViewController.instantiate()
        let settingViewModel = SettingViewModel.init()
        let tabTwoBarItem3 = UITabBarItem(title: "Setting", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        tabThree.modalPresentationStyle = .fullScreen
        tabThree.coordinator = self
        tabThree.viewModel = settingViewModel
        tabThree.tabBarItem = tabTwoBarItem3
        
        viewController.viewControllers = [tabOne, tabTwo, tabThree]
        viewController.selectedIndex = 0
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
    
    func presentHabitDetailVC() {
        navigationController.navigationBar.isHidden = false
        navigationController.navigationBar.topItem?.title = "Work Out!"
        let viewController = HabitDetailViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
        
        // pop일때 navigation bar hidden정의를 어떻게 해줘야 하지
    }
    
    func presentBakeryVC() {
        let viewController = BakeryViewController.instantiate()
        viewController.coordinator = self
        // Consider animation for modal push
        navigationController.pushViewController(viewController, animated: true)
    }
}
