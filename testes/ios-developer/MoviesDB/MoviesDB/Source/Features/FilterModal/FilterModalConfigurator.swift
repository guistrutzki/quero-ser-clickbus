//
//  FilterModalConfigurator.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import Foundation

class FilterModalConfigurator {
    static func configureModule(viewController: FilterModalVC) {
        let view = FilterModalView()
        let router = FilterModalRouterImplementation()
        let interactor = FilterModalInteractorImplementation()
        let presenter = FilterModalPresenterImplementation()
        
        viewController.filterModalView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        router.viewController = viewController
        presenter.viewController = viewController
    }
}
