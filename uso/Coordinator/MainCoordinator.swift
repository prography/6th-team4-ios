//
//  MainCoordinator.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    // Navigation tree can be structed by using list of child coordinators
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        // Bind relationship between VC, ViewModel, and UseCase
        let viewModel = SignViewModel.init()
        viewModel.bind(usecase: RootUseCase())
        let viewController = SignViewController.instantiate(storyboardName: "SignViewController")
        viewController.viewModel = viewModel
        viewController.coordinator = self
        // Navigate VC
        viewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(viewController, animated: false)
    }
    func presentMainTabVC() {
        let viewController = MainTabViewController.instantiate(storyboardName: "MainTabViewController")
        // Create Tab one
        let tabOne = HabitListViewController.instantiate(storyboardName: "HabitListViewController")
        let tabOneBarItem1 = UITabBarItem(title: "Habit", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        tabOne.modalPresentationStyle = .fullScreen
        tabOne.tabBarItem = tabOneBarItem1
        // Create Tab two
        let tabTwo = RankingViewController.instantiate(storyboardName: "RankingViewController")
        let tabTwoBarItem2 = UITabBarItem(title: "Ranking", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        tabTwo.modalPresentationStyle = .fullScreen
        tabTwo.tabBarItem = tabTwoBarItem2
        // Create Tab three
        let tabThree = SettingViewController.instantiate(storyboardName: "SettingViewController")
        let tabTwoBarItem3 = UITabBarItem(title: "Setting", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        tabThree.modalPresentationStyle = .fullScreen
        tabThree.tabBarItem = tabTwoBarItem3
        viewController.viewControllers = [tabOne, tabTwo, tabThree]
        viewController.selectedIndex = 0
        navigationController.popViewController(animated: false)
        navigationController.pushViewController(viewController, animated: true)
    }
    //    func presentHabitListVC() {
    //        let habitListCoordinator = HabitListCoordinator(navigationController: navigationController)
    //        habitListCoordinator.parentCoordinator = self
    //        childCoordinators.append(habitListCoordinator)
    //        habitListCoordinator.start()
    //    }
    //
    //    func presentRankingVC() {
    //        let rankingCoordinator = RankingCoordinator(navigationController: navigationController)
    //        rankingCoordinator.parentCoordinator = self
    //        childCoordinators.append(rankingCoordinator)
    //        rankingCoordinator.start()
    //    }
    //
    //    func presentSettingVC() {
    //        let settingCoordinator = SettingCoordinator(navigationController: navigationController)
    //        settingCoordinator.parentCoordinator = self
    //        childCoordinators.append(settingCoordinator)
    //        settingCoordinator.start()
    //    }
}
