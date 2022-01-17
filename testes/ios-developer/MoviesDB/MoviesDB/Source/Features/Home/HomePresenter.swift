//
//  HomePresenter.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import Foundation
import Alamofire

protocol HomePresenter: AnyObject {
    func interactor(didRetrieveMovies movies: [Movie])
    func interactor(didFailRetrieveMovies error: AFError)
}

class HomePresenterImplementation: HomePresenter {
    weak var viewController: HomePresenterOutput?
    
    func interactor(didRetrieveMovies movies: [Movie]) {
        let movieCellModel = movies.compactMap { MovieCardCellModel(coverImage: $0.posterPath ?? "",
                                                                    title: $0.title,
                                                                    average: "IMDb: \($0.voteAverage)",
                                                                    votesCount: "Votos: \($0.voteCount)" ) }
        viewController?.presenter(didRetrieveMovies: movieCellModel)
    }
    
    func interactor(didFailRetrieveMovies error: AFError) {
        viewController?.presenter(didFailRetrieveItems: error.localizedDescription)
    }
}
