//
//  GenreCarouselView.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import UIKit

struct GenreCarouselConfiguration {
    let genres: [String]
}

class GenreCarouselView: UIView {
    private var items: [Genre] = []
    
    private lazy var carouselCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.register(GenreCarouselCollectionViewCell.self,
                      forCellWithReuseIdentifier: GenreCarouselCollectionViewCell.classIdentifier())
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = Theme.dark
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
        return CGSize(width: UIView.noIntrinsicMetric, height: 25)
    }
    
    public func updateView(with configuration: [Genre]) {
        items = configuration
        carouselCollectionView.reloadData()
    }
}

extension GenreCarouselView: ViewCode {
    func configureSubviews() {
        addSubview(carouselCollectionView)
    }
    
    func configureSubviewsConstraints() {
        carouselCollectionView.snp.makeConstraints { make in
            make.trailing.leading.bottom.top.equalToSuperview()
        }
    }
    
    func configureAdditionalBehaviors() {}
}

extension GenreCarouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GenreCarouselCollectionViewCell.classIdentifier(),
            for: indexPath) as? GenreCarouselCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.configure(with:
                        GenreCarouselCollectionViewCellConfiguration(genre: items[indexPath.row].name))
        return cell
    }
}

extension GenreCarouselView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.row].name
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)
        ])
        let labelSizeWithPadding = itemSize.width + 24
        return CGSize(width: labelSizeWithPadding, height: 25)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}
