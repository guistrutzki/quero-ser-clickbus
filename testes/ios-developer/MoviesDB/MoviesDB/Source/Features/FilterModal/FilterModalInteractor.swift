//
//  FilterModalInteractor.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import Foundation

protocol FilterModalInteractor: AnyObject {
    func viewDidLoad()
    func updateSelectedGenres(index: Int)
    var selectedGenres: [String] { get }
}

class FilterModalInteractorImplementation: FilterModalInteractor {
    var presenter: FilterModalPresenter?
    var genres: [Genre] = []
    var selectedGenres: [String] = []
    
    func updateSelectedGenres(index: Int) {
        let text = genres[index].name
        
        selectedGenres.contains(obj: text)
            ? selectedGenres = selectedGenres.filter { $0 != text }
            : selectedGenres.append(text)
    }
    
    func viewDidLoad() {
        GenreListWorker().fetchGenreList(
            sucess: { response in
                guard let genres = response?.genres else { return }
                self.genres = genres
                self.presenter?.interactor(didRetrieveGenres: genres)
            },
            failure: { error in
                self.presenter?.interactor(didFailRetrieveGenres: error!)
            })
    }
}
