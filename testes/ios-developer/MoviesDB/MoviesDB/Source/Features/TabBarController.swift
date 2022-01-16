//
//  TabBarController.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 15, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .systemGray6
            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance
        } else {
            tabBar.barTintColor = .systemGray6
        }
        
        let homeVC = HomeVC()
        HomeConfigurator.configureModule(viewController: homeVC)
        let homeTab = UINavigationController(rootViewController: homeVC)
        homeTab.navigationBar.prefersLargeTitles = true
        homeTab.navigationBar.barStyle = .black
        let homeIcon = UITabBarItem(title: Txt.home,
                                    image: SFSymbols.home,
                                    tag: 0)
        homeTab.tabBarItem = homeIcon
        
        self.setViewControllers([homeTab], animated: false)
        
    }
}
