//
//  ViewCode.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import UIKit
import SnapKit

protocol ViewCode where Self: UIView {
    func configureSubviews()
    func configureSubviewsConstraints()
    func configureAdditionalBehaviors()
}

extension ViewCode {
    public func setupViews() {
        configureSubviews()
        configureSubviewsConstraints()
        configureAdditionalBehaviors()
    }
}
