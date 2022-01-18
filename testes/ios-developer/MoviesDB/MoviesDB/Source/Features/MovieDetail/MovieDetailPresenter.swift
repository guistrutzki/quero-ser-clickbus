//
//  MovieDetailPresenter.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import Foundation
import Alamofire

protocol MovieDetailPresenter: AnyObject {
    func interactor(didRetrieveMovieDetails movieDetails: MovieDetails)
    func interactor(didFailRetrieveMovieDetails error: AFError)
}

class MovieDetailPresenterImplementation: MovieDetailPresenter {
    weak var viewController: MovieDetailPresenterOutput?
    
    func interactor(didRetrieveMovieDetails movieDetails: MovieDetails) {
        viewController?.presenter(didRetrieveMovieDetails: movieDetails)
    }
    
    func interactor(didFailRetrieveMovieDetails error: AFError) {
        viewController?.presenter(didFailRetrieveMovieDetails: error.localizedDescription)
    }
}
