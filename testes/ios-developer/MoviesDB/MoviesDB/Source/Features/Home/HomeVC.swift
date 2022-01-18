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
    
    func presenter(didObtainMovieId id: Int)
    func presenter(didFailObtainMovieId message: String)
}

class HomeVC: UIViewController {
    var homeView: HomeView?
    var interactor: HomeInteractor?
    var router: HomeRouter?
    
    private var movies: [MovieCardCellModel] = []
    
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
    func presenter(didObtainMovieId id: Int) {
        router?.routeToDetail(with: String(id))
    }
    
    func presenter(didRetrieveMovies items: [MovieCardCellModel]) {
        self.movies = items
        homeView?.tableView.reloadData()
    }
    
    func presenter(didFailRetrieveItems message: String) {
        print(message)
    }
    
    func presenter(didFailObtainMovieId message: String) {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.interactor?.didSelectRow(at: indexPath.row)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let tableViewOffset = scrollView.contentOffset.y + scrollView.frame.size.height
        if (tableViewOffset >= scrollView.contentSize.height) {
            self.interactor?.didPullToRefresh()
        }
    }
}
