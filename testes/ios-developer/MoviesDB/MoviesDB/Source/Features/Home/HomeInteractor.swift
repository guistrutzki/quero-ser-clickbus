//
//  HomeInteractor.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import Foundation

protocol HomeInteractor: AnyObject {
    func viewDidLoad()
}

class HomeInteractorImplementation: HomeInteractor {
    var presenter: HomePresenter?
    
    func viewDidLoad() {
        MovieListWorker().fetchMovieList(
            section: .popular, page: 1,
            sucess: { response in
                guard let movies = response?.results else { return }
                self.presenter?.interactor(didRetrieveMovies: movies)
            },
            failure: { error in
                self.presenter?.interactor(didFailRetrieveMovies: error!)
            })
    }

}
