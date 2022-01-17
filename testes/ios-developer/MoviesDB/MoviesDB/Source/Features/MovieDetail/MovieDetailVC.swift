//
//  MovieDetailVC.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 17/01/22.
//

import UIKit

class MovieDetailVC: UIViewController {
    var movieDetailView: MovieDetailView?
    
    override func loadView() {
        super.loadView()
        self.view = movieDetailView
        
        navigationItem.title = "Teste 123"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

