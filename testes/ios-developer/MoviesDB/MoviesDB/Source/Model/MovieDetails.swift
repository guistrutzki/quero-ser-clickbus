//
//  MovieDetails.swift
//  MoviesDB
//
//  Created by Ruan Reis on 09/10/20.
//

import Foundation

struct MovieDetails: Decodable {
    let title: String
    
    let budget: Double
    
    let revenue: Double
    
    let runtime: Int
    
    let genres: [Genre]
    
    let credits: Credits
    
    let backdropPath: String
    
    let voteAverage: Double
    
    let releaseDate: String
    
    let overview: String
    
    var relaseDateFormatted: String? {
        releaseDate
            .asDate(format: "yyyy-MM-dd")?
            .stringFormat
        
    }
}
