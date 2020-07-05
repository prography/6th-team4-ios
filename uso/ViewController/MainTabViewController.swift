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
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 100
        tabBar.frame.origin.y = view.frame.height - 100
    }
    
    func layout() {
        
        tabBar.tintColor = .brown
        
        // Create Tab one
        let tabOne = HabitListViewController.instantiate()
        let habitListViewModel = HabitListViewModel.init()
        let tabOneBarItem1 = UITabBarItem(title: "Habit", image: UIImage(named: "breadTabIcon.png"), selectedImage: UIImage(named: "breadTabIcon.png"))
        tabOne.modalPresentationStyle = .fullScreen
        tabOne.coordinator = coordinator.self
        tabOne.viewModel = habitListViewModel
        tabOne.tabBarItem = tabOneBarItem1
        
        
        // Create Tab two
        let tabTwo = RankingViewController.instantiate()
        let tabTwoBarItem2 = UITabBarItem(title: "Ranking", image: UIImage(named: "rankingTabIcon.png"), selectedImage: UIImage(named: "rankingTabIcon.png"))
        let rankingViewModel = RankingViewModel.init()
        rankingViewModel.bind(usecase: RankingUseCase())
        tabTwo.viewModel = rankingViewModel
        tabTwo.coordinator = coordinator.self
        tabTwo.modalPresentationStyle = .fullScreen
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab three
        let tabThree = SettingViewController.instantiate()
        let tabTwoBarItem3 = UITabBarItem(title: "Setting", image: UIImage(named: "profileTabIcon.png"), selectedImage: UIImage(named: "profileTabIcon.png"))
        
        let settingViewModel = SettingViewModel.init()
        settingViewModel.bind(usecase: RootUseCase())
        tabThree.viewModel = settingViewModel
    
        tabThree.modalPresentationStyle = .fullScreen
        tabThree.tabBarItem = tabTwoBarItem3
        
        viewControllers = [tabOne, tabTwo, tabThree]
        selectedIndex = 0
    }
}

// MARK: Detail func definition of VC
extension MainTabViewController: Storyboarded {
}

