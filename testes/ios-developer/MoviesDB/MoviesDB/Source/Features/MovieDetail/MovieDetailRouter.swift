//
//  MovieDetailRouter.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import UIKit

protocol MovieDetailRouter: AnyObject {
    func routeToHome()
}

class MovieDetailRouterImplementation: MovieDetailRouter {
    weak var viewController: MovieDetailVC?
    
    func routeToHome() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
