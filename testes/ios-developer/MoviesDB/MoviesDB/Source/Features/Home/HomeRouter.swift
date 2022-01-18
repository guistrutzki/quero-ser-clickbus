//
//  HomeRouter.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import UIKit

protocol HomeRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    func routeToDetail(with id: String)
}

class HomeRouterImplementation: HomeRouter {
    weak var navigationController: UINavigationController?
    
    func routeToDetail(with id: String) {
        let movieDetailVC = MovieDetailVC()
        MovieDetailConfigurator.configureModule(titleId: id, viewController: movieDetailVC)

        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
