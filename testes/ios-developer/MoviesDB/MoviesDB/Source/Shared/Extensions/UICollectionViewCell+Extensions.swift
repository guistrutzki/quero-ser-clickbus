//
//  UICollectionViewCell+Extensions.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import UIKit

extension UICollectionViewCell {

    class func classIdentifier() -> String {
        guard let className = String(describing: self).components(separatedBy: ".").last else {
            return ""
        }

        return className
    }
}
