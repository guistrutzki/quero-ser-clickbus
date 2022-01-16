//
//  UITableViewCell+Extensions.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import UIKit

extension UITableViewCell {

    class func classIdentifier() -> String {
        guard let className = String(describing: self).components(separatedBy: ".").last else {
            return ""
        }

        return className
    }
}
