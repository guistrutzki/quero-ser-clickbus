//
//  MovieDetailConfigurator.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import Foundation

class MovieDetailConfigurator {
    static func configureModule(titleId: String, viewController: MovieDetailVC) {
        let view = MovieDetailView()
        
        viewController.movieDetailView = view
    }
}
