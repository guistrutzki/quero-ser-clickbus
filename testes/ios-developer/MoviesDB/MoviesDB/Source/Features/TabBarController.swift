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
        
        // MARK: - Appearance
        if #available(iOS 15, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .systemGray6
            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance
        } else {
            tabBar.barTintColor = .systemGray6
            
        }
        
        // MARK: - VCs
        let homeTab = UINavigationController(rootViewController:  HomeVC())
        let homeIcon = UITabBarItem(title: "Home",
                                    image: UIImage(systemName: "house"),
                                    tag: 0)
        homeTab.tabBarItem = homeIcon
        
        self.setViewControllers([homeTab], animated: false)
    }
}
