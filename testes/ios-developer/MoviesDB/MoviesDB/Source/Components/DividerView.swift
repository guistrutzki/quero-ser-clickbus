//
//  DividerView.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import UIKit

class DividerView: UIView {
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 0.5)
    }
}

extension DividerView: ViewCode {
    func configureSubviews() {}
    
    func configureSubviewsConstraints() {}
    
    func configureAdditionalBehaviors() {
        self.backgroundColor = Theme.grey100
    }
}
