//
//  MovieDetailInteractor.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import Foundation

protocol MovieDetailInteractor: AnyObject {
    func viewDidLoad()
    var titleId: String? { get }
}

class MovieDetailInteractorImplementation: MovieDetailInteractor {
    var presenter: MovieDetailPresenter?
    var titleId: String?
    private var movieDetails: MovieDetails?
    
    func viewDidLoad() {
        MovieDetailsWorker().fetchMovieDetails(
            of: NumberFormatter().number(from: titleId ?? "0")?.intValue ?? 0,
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
