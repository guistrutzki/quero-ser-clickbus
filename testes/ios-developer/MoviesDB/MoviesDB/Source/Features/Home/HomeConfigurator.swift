//
//  HomeConfigurator.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import Foundation

class HomeConfigurator {
    static func configureModule(viewController: HomeVC) {
        let view = HomeView()
        viewController.homeView = view
    }
}
