//
//  Constants.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import UIKit

enum Txt {
    static let home                     = "Início"
    static let popularMovies            = "Filmes Populares"
}

enum SFSymbols {
    static let home                     = UIImage(systemName: "house")
    static let star                     = UIImage(systemName: "star.fill")
    static let clock                    = UIImage(systemName: "clock")
    static let arrowLeft                = UIImage(systemName: "chevron.left")
    static let filter                   = UIImage(systemName: "slider.vertical.3")
}

enum Fonts {
    static let poppinsRegular           = "Poppins-Regular"
    static let poppinsBold              = "Poppins-Bold"
    static let poppinsMedium            = "Poppins-Medium"
}

enum Theme {
    static let dark                     = UIColor("#15141F")
    static let dark_35                  = UIColor("#000000", alpha: 0.35)
    static let dark_40                  = UIColor("#000000", alpha: 0.40)
    static let light                    = UIColor("#ffffff")
    static let light_20                 = UIColor("#ffffff", alpha: 0.2)
    static let light_30                 = UIColor("#ffffff", alpha: 0.3)
    static let grey100                  = UIColor("#515151")
    static let grey200                  = UIColor("#BCBCBC")
    static let grey200_50               = UIColor("#BCBCBC", alpha: 0.5)
    static let orange200                = UIColor("#FF8F71")
    static let green200                 = UIColor("#00dea1")
    static let green200_50              = UIColor("#00dea1", alpha: 0.5)
}
