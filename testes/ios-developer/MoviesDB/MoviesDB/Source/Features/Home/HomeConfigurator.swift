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
        let router = HomeRouterImplementation()
        let interactor = HomeInteractorImplementation()
        let presenter = HomePresenterImplementation()
        
        viewController.homeView = view
        viewController.router = router
        viewController.interactor = interactor
  
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
