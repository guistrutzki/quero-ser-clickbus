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
        let viewController = MovieDetailVC()
        MovieDetailConfigurator.configureModule(titleId: id, viewController: viewController)

        navigationController?.pushViewController(viewController, animated: true)
    }
}
