//
//  GenreCarouselCollectionViewCell.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import UIKit

struct GenreCarouselCollectionViewCellConfiguration {
    let genre: String
}

class GenreCarouselCollectionViewCell: UICollectionViewCell {
    private let tagView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = Theme.grey200_50.cgColor
        view.backgroundColor = .clear
        return view
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsRegular, size: 12)
        label.textColor = Theme.grey200
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with configuration: GenreCarouselCollectionViewCellConfiguration) {
        genreLabel.text = configuration.genre
    }
}

extension GenreCarouselCollectionViewCell: ViewCode {
    func configureSubviews() {
        addSubview(tagView)
        tagView.addSubview(genreLabel)
    }
    
    func configureSubviewsConstraints() {
        tagView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
            make.height.equalTo(25)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func configureAdditionalBehaviors() {}
}
