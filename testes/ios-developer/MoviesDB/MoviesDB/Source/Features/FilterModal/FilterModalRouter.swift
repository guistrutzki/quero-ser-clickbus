//
//  FilterModalRouter.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import UIKit

protocol FilterModalRouter: AnyObject {
    func routeToHome(filters: [String])
}

class FilterModalRouterImplementation: FilterModalRouter {
    weak var viewController: FilterModalVC?
    
    func routeToHome(filters: [String]) {
        //TODO: Pass filter data to HomeVC
        viewController?.dismiss(animated: true)
    }
}
