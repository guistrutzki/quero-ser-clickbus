//
//  FilterModalView.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import UIKit
import TTGTags

class FilterModalView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsBold, size: 24)
        label.textColor = Theme.light
        label.text = "Filtros"
        return label
    }()
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(SFSymbols.arrowLeft, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    public var collectionView: TTGTextTagCollectionView = {
        let collectionView = TTGTextTagCollectionView()
        collectionView.alignment = .center
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterModalView: ViewCode {
    func configureSubviews() {
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(collectionView)
    }
    
    func configureSubviewsConstraints() {
        backButton.snp.makeConstraints { make in
             make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
             make.leading.equalToSuperview().offset(26)
             make.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
             make.centerY.equalTo(backButton.snp.centerY)
             make.centerX.equalToSuperview()
             make.height.equalTo(24)
        }
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = Theme.dark
    }
}
