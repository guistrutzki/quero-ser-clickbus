//
//  MovieDetailView.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import UIKit

class MovieDetailView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = Theme.dark
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsMedium, size: 24)
        label.textColor = Theme.light
        return label
    }()
    
    private let durationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SFSymbols.clock
        imageView.tintColor = Theme.grey200
        
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(12)
        }
        return imageView
    }()
    
    private let durationLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsRegular, size: 12)
        label.textColor = Theme.grey200
        return label
    }()
    
    private lazy var durationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [durationImageView, durationLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    private let ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SFSymbols.star
        imageView.tintColor = Theme.grey200
        
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(12)
        }
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsRegular, size: 12)
        label.textColor = Theme.grey200
        return label
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ratingImageView, ratingLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    private let titleDetailView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var titleSectionStackView: UIStackView = {
        let dividerView = DividerView()
        let stackView = UIStackView(arrangedSubviews: [titleLabel, titleDetailView, dividerView])
    
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.setCustomSpacing(36, after: titleDetailView)
        return stackView
    }()
    
    private let releaseTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsMedium, size: 16)
        label.textColor = Theme.light
        label.text = "Lançamento"
        return label
    }()
    
    private let releaseValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsRegular, size: 12)
        label.textColor = Theme.grey200
        return label
    }()
    
    private lazy var releaseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [releaseTitleLabel, releaseValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let genreTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsMedium, size: 16)
        label.textColor = Theme.light
        label.text = "Genêro"
        return label
    }()
    
    private let genreCarouselView: GenreCarouselView = {
        let view = GenreCarouselView()
        return view
    }()
    
    private lazy var genreStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [genreTitleLabel, genreCarouselView])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var generalSectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [releaseStackView, genreStackView])
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 50
        return stackView
    }()
    
    private let aboutTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsMedium, size: 16)
        label.textColor = Theme.light
        label.text = "Sobre"
        return label
    }()
    
    private let aboutTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.poppinsRegular, size: 12)
        label.textColor = Theme.grey200
        label.numberOfLines = 0
        return label
    }()
    
    private let aboutDividerView: DividerView = {
        let view = DividerView()
        return view
    }()
    
    private lazy var aboutSectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [aboutTitleLabel, aboutTextLabel])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateView(with configuration: MovieDetails) {
        titleLabel.text = configuration.title
        durationLabel.text = "\(configuration.runtime) minutos"
        ratingLabel.text = "\(configuration.voteAverage) (IMDb)"
        releaseValueLabel.text = configuration.relaseDateFormatted
        aboutTextLabel.text = configuration.overview
        genreCarouselView.updateView(with: configuration.genres)
        coverImageView.loadImage(path: configuration.backdropPath, size: .w500)
    }
}

extension MovieDetailView: ViewCode {
    func configureSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleSectionStackView)
        titleDetailView.addSubview(durationStackView)
        titleDetailView.addSubview(ratingStackView)
        contentView.addSubview(generalSectionStackView)
        contentView.addSubview(aboutDividerView)
        contentView.addSubview(aboutSectionStackView)
    }
    
    func configureSubviewsConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.scrollView)
            make.left.right.equalTo(self)
            make.width.equalTo(self.scrollView)
            make.height.equalTo(self.scrollView)
        }
        
        coverImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        titleSectionStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(coverImageView.snp.bottom).offset(24)
        }
        
        durationStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        ratingStackView.snp.makeConstraints { make in
            make.leading.equalTo(durationLabel.snp.trailing).offset(24)
        }
        
        generalSectionStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(titleSectionStackView.snp.bottom).offset(16)
        }
        
        aboutDividerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(generalSectionStackView.snp.bottom).offset(24)
        }
        
        aboutSectionStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(aboutDividerView.snp.bottom).offset(16)
        }
    }
    
    func configureAdditionalBehaviors() {}
}
