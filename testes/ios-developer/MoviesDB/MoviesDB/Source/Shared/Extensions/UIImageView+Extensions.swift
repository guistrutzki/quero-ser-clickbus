//
//  UIImageView+Extensions.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(path imagePath: String, size: MovieAPI.ImageSize) {
        self.kf.indicatorType = .activity
        let retry = DelayRetryStrategy(maxRetryCount: 2,
                                       retryInterval: .seconds(1))
        self.kf.setImage(with: URL(string: MovieAPI.build(image: imagePath, size: size)),
                                   options: [.retryStrategy(retry),
                                             .transition(ImageTransition
                                                            .fade(2))]) { result in
            switch result {
            case .failure:
                self.image = #imageLiteral(resourceName: "placeholder-image")
            default: break
            }
        }
    }
}
