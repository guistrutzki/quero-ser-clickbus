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
    func didPullToRefresh()
}

class HomeInteractorImplementation: HomeInteractor {
    var presenter: HomePresenter?
    var page = 1
    private var movies: [Movie] = []
    
    func loadMovies(page: Int) {
        MovieListWorker().fetchMovieList(
            section: .popular, page: page,
            sucess: { response in
                guard let movies = response?.results else { return }
                self.movies += movies
                print(self.movies.count)
                self.presenter?.interactor(didRetrieveMovies: self.movies)
            },
            failure: { error in
                self.presenter?.interactor(didFailRetrieveMovies: error!)
            })
    }
    
    func viewDidLoad() {
        loadMovies(page: 1)
    }
    
    func didPullToRefresh() {
        page += 1
        loadMovies(page: page)
    }
    
    func didSelectRow(at index: Int) {
        if (self.movies.indices.contains(index)) {
            self.presenter?.interactor(didFindMovie: movies[index])
        }
    }

}
