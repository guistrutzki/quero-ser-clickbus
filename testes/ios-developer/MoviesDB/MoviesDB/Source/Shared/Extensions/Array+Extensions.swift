//
//  Array+Extensions.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 19/01/22.
//

import Foundation

extension Array {
     func contains<T>(obj: T) -> Bool where T: Equatable {
         return !self.filter({$0 as? T == obj}).isEmpty
     }
 }
