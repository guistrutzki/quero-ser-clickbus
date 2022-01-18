//
//  MovieDetailConfigurator.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import Foundation

class MovieDetailConfigurator {
    static func configureModule(titleId: String, viewController: MovieDetailVC) {
        let view = MovieDetailView()
        let router = MovieDetailRouterImplementation()
        let interactor = MovieDetailInteractorImplementation()
        let presenter = MovieDetailPresenterImplementation()
        
        viewController.movieDetailView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        interactor.titleId = titleId
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
