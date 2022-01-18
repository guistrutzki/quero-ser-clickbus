//
//  ImageGalleryCollectionViewCell.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import UIKit

class ImageGalleryCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(140)
        }
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = Theme.light_20
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsMedium, size: 12)
        label.textColor = Theme.grey200
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with configuration: ImageGalleryViewConfiguration.ImageGalleryModel) {
        nameLabel.text = configuration.description
        imageView.loadImage(path: configuration.path, size: .w300)
    }
}

extension ImageGalleryCollectionViewCell: ViewCode {
    func configureSubviews() {
        addSubview(containerStackView)
    }
    
    func configureSubviewsConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalToSuperview()
        }
    }
    
    func configureAdditionalBehaviors() {}
}
