//
//  Date+Extensions.swift
//  MoviesDB
//
//  Created by Ruan Reis on 09/10/20.
//

import Foundation

extension Date {

    var stringFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: self)
    }
}

