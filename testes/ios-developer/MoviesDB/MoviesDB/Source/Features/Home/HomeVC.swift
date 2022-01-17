//
//  HomeVC.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 16/01/22.
//

import UIKit

protocol HomePresenterOutput: AnyObject {
    func presenter(didRetrieveMovies items: [MovieCardCellModel])
    func presenter(didFailRetrieveItems message: String)
}

class HomeVC: UIViewController {
    var homeView: HomeView?
    var interactor: HomeInteractor?
    
    private var movies: [MovieCardCellModel] = []
    
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
        
        interactor?.viewDidLoad()
    }
}

extension HomeVC: HomePresenterOutput {
    func presenter(didRetrieveMovies items: [MovieCardCellModel]) {
        self.movies = items
        homeView?.tableView.reloadData()
    }
    
    func presenter(didFailRetrieveItems message: String) {
        print(message)
    }
    
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { movies.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: MovieCardCell.classIdentifier()) as? MovieCardCell else {
                   return UITableViewCell()
                }
        cell.selectionStyle = .none
        cell.updateView(with: movies[indexPath.row])
        return cell
    }
}
