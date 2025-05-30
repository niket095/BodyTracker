//
//  MainTabBarController.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 04.02.2025.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
        setupItems()
    }
    
    private func setupTabbar() {
        tabBar.backgroundColor = .specialBackgroundTabBar
        tabBar.tintColor = .specialGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderColor = UIColor.specialGray.cgColor
        tabBar.layer.borderWidth = 1.5
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let statisticVC = StatisticViewController()
        let profilVC = ProfilViewController()
        
        setViewControllers([mainVC,
                            statisticVC,
                            profilVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Главная"
        items[1].title = "Статистика"
        items[2].title = "Профиль"
        
        items[0].image = UIImage(systemName: "dumbbell")
        items[1].image = UIImage(systemName: "medal")
        items[2].image = UIImage(systemName: "figure.mixed.cardio")
    }
}
