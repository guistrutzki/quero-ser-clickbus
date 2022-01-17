//
//  HomeInteractor.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import Foundation

protocol HomeInteractor: AnyObject {
    func viewDidLoad()
    func didSelectRow(at index: Int)
}

class HomeInteractorImplementation: HomeInteractor {
    var presenter: HomePresenter?
    private var movies: [Movie] = []
    
    func viewDidLoad() {
        MovieListWorker().fetchMovieList(
            section: .popular, page: 1,
            sucess: { response in
                guard let movies = response?.results else { return }
                self.movies = movies
                self.presenter?.interactor(didRetrieveMovies: movies)
            },
            failure: { error in
                self.presenter?.interactor(didFailRetrieveMovies: error!)
            })
    }
    
    func didSelectRow(at index: Int) {
        if (self.movies.indices.contains(index)) {
            self.presenter?.interactor(didFindMovie: movies[index])
        }
    }

}
