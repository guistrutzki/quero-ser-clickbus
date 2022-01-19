//
//  MovieCardCell.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import UIKit
import Kingfisher

struct MovieCardCellModel {
    var coverImage: String
    var title: String
    var average: String
    var votesCount: String
}

class MovieCardCell: UITableViewCell {
    private var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        imageView.snp.makeConstraints({ make in
            make.width.equalTo(150)
            make.height.equalTo(220)
        })
        return imageView
    }()
    
    private var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.contentMode = .scaleToFill
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    private var averageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.green200
        
        return label
    }()
    
    private var votesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.green200
        return label
    }()
    
    private lazy var labelContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [coverImageView, labelContainerView])
        stack.distribution = .fill
        stack.spacing = 10
        stack.backgroundColor = .none
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configTextValue() {
        let imdbAttributedString = NSMutableAttributedString.init(string: averageLabel.text ?? "")
        let votesAttributedString = NSMutableAttributedString.init(string: votesCountLabel.text ?? "")
        
        let rangeImdb = NSString(string: averageLabel.text ?? "")
            .range(of: "IMDb:", options: String.CompareOptions.caseInsensitive)
        let rangeVotes = NSString(string: votesCountLabel.text ?? "")
            .range(of: "Votos:", options: String.CompareOptions.caseInsensitive)
        
        let attributes:[NSAttributedString.Key : Any] = [.foregroundColor : UIColor.white,
                                                         .font : UIFont.systemFont(ofSize: 18, weight: .semibold)]
        imdbAttributedString.addAttributes(attributes, range: rangeImdb)
        votesAttributedString.addAttributes(attributes, range: rangeVotes)
        
        averageLabel.attributedText = imdbAttributedString
        votesCountLabel.attributedText = votesAttributedString
    }
    
    public func updateView(with configuration: MovieCardCellModel) {
        title.text = configuration.title
        averageLabel.text = configuration.average
        votesCountLabel.text = configuration.votesCount
        coverImageView.loadImage(path: configuration.coverImage, size: .w500)
        configTextValue()
        
    }
}

extension MovieCardCell: ViewCode {
    func configureSubviews() {
        addSubview(containerStackView)
        labelContainerView.addSubview(title)
        labelContainerView.addSubview(averageLabel)
        labelContainerView.addSubview(votesCountLabel)
    }
    
    func configureSubviewsConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.top.equalToSuperview().inset(10)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview()
        }
        
        averageLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(15)
            make.leading.equalToSuperview()
        }
        
        votesCountLabel.snp.makeConstraints { make in
            make.top.equalTo(averageLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
        }
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = UIColor.white.withAlphaComponent(0)
    }
}
