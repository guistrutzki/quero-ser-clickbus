//
//  ImageGalleryView.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import UIKit

struct ImageGalleryViewConfiguration {
    let items: [ImageGalleryModel]
    
    struct ImageGalleryModel {
        let path: String
        let description: String
    }
}

class ImageGalleryView: UIView {
    var items: [ImageGalleryViewConfiguration.ImageGalleryModel] = []
    
    private lazy var galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.register(ImageGalleryCollectionViewCell.self,
                      forCellWithReuseIdentifier: ImageGalleryCollectionViewCell.classIdentifier())
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        return view
    }()
 
    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 160)
    }
    
    public func updateView(with configuration: [ImageGalleryViewConfiguration.ImageGalleryModel]) {
        items = configuration
        galleryCollectionView.reloadData()
    }

}

extension ImageGalleryView: ViewCode {
    func configureSubviews() {
        addSubview(galleryCollectionView)
    }
    
    func configureSubviewsConstraints() {
        galleryCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func configureAdditionalBehaviors() {}
}

extension ImageGalleryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageGalleryCollectionViewCell.classIdentifier(),
            for: indexPath) as? ImageGalleryCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.configure(with:
                        ImageGalleryViewConfiguration.ImageGalleryModel(path: items[indexPath.row].path,
                                                                        description: items[indexPath.row].description))
        return cell
    }
}

extension ImageGalleryView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}
