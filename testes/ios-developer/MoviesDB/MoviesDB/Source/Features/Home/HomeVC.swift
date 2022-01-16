//
//  HomeVC.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import UIKit

protocol HomePresenterOutput: AnyObject {
    func presenter(didRetrieveMovies items: [String])
    func presenter(didFailRetrieveItems message: String)
}

class HomeVC: UIViewController {
    var homeView: HomeView?
//    var interactor: HomeInteractor?
//    var router: HomeRouter?
    
    override func loadView() {
        super.loadView()
        self.view = homeView
        
        navigationItem.title = "Filmes Populares"
        
        homeView?.tableView.delegate = self
        homeView?.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 4 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: MovieCardCell.classIdentifier()) as? MovieCardCell else {
                   return UITableViewCell()
                }
        cell.selectionStyle = .none
        cell.updateView(with: MovieCardCellModel(coverImage: UIImage(),
                                                 title: "Senhor dos aneis",
                                                 average: "IMDb: 8,0",
                                                 votesCount: "Votos: 2323"))
        return cell
    }
}
