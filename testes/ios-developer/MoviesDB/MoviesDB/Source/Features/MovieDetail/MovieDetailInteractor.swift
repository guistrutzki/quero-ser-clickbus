//
//  MovieDetailInteractor.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import Foundation

protocol MovieDetailInteractor: AnyObject {
    func viewDidLoad()
}

class MovieDetailInteractorImplementation: MovieDetailInteractor {
    var presenter: MovieDetailPresenter?
    private var movieDetails: MovieDetails?
    
    func viewDidLoad() {
        MovieDetailsWorker().fetchMovieDetails(
            of: 497582,
            sucess: { details in
                guard let details = details else { return }
                self.movieDetails = details
                self.presenter?.interactor(didRetrieveMovieDetails: details)
            },
            failure: { error in
                self.presenter?.interactor(didFailRetrieveMovieDetails: error!)
            })
    }
}
