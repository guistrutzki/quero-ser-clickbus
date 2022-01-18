//
//  MovieDetailVC.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import UIKit

protocol MovieDetailPresenterOutput: AnyObject {
    func presenter(didRetrieveMovieDetails movieDetails: MovieDetails)
    func presenter(didFailRetrieveMovieDetails message: String)
}

class MovieDetailVC: UIViewController {
    var movieDetailView: MovieDetailView?
    var router: MovieDetailRouter?
    var interactor: MovieDetailInteractor?
    
    override func loadView() {
        super.loadView()
        self.view = movieDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(didTappedBackButton(_:)))
        movieDetailView?.backNavigationView.addGestureRecognizer(tap)
        self.navigationController?.navigationBar.isTranslucent = true
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func didTappedBackButton(_ sender: UITapGestureRecognizer) {
        router?.routeToHome()
    }
}

extension MovieDetailVC: MovieDetailPresenterOutput {
    func presenter(didRetrieveMovieDetails movieDetails: MovieDetails) {
        movieDetailView?.updateView(with: movieDetails)
    }
    
    func presenter(didFailRetrieveMovieDetails message: String) {
        print(message)
    }
}
