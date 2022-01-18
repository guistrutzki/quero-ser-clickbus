//
//  HomeView.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import UIKit

class HomeView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MovieCardCell.self, forCellReuseIdentifier: MovieCardCell.classIdentifier())
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = Theme.dark
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCode {
    func configureSubviews() {
        addSubview(tableView)
    }
    
    func configureSubviewsConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func configureAdditionalBehaviors() {}
}
