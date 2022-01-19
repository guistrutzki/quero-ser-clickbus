//
//  FilterModalPresenter.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import Foundation
import Alamofire

protocol FilterModalPresenter: AnyObject {
    func interactor(didRetrieveGenres genres: [Genre])
    func interactor(didFailRetrieveGenres error: AFError)
}

class FilterModalPresenterImplementation: FilterModalPresenter {
    weak var viewController: FilterModalPresenterOutput?
    
    func interactor(didRetrieveGenres genres: [Genre]) {
        viewController?.presenter(didRetrieveGenres: genres)
    }
    
    func interactor(didFailRetrieveGenres error: AFError) {
        viewController?.presenter(didFailRetrieveGenres: error.localizedDescription)
    }
}
