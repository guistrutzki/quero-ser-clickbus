//
//  MovieDetailRouter.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import UIKit

protocol MovieDetailRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    func routeToHome()
}

class MovieDetailRouterImplementation: MovieDetailRouter {
    weak var navigationController: UINavigationController?
    
    func routeToHome() {
        navigationController?.popViewController(animated: true)
    }
}
