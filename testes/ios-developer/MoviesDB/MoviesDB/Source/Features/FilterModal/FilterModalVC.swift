//
//  FilterModalVC.swift
//  MoviesDB
//
//  Created by Guilherme Strutzki on 18/01/22.
//

import UIKit
import TTGTags

protocol FilterModalPresenterOutput: AnyObject {
    func presenter(didRetrieveGenres genres: [Genre])
    func presenter(didFailRetrieveGenres message: String)
}

class FilterModalVC: UIViewController {
    var filterModalView: FilterModalView?
    var router: FilterModalRouter?
    var interactor: FilterModalInteractor?
    
    override func loadView() {
        super.loadView()
        self.view = filterModalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
        
        filterModalView?.backButton.addTarget(self,
                                              action: #selector(didTappedBackButton(_:)),
                                              for: .touchUpInside)
        filterModalView?.collectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        filterModalView?.collectionView.frame = CGRect(x: 0,
                                                       y: 100,
                                                       width: view.frame.size.width,
                                                       height: 300)
    }
    
    @objc
    private func didTappedBackButton(_ button: UIButton) {
        router?.routeToHome(filters: interactor?.selectedGenres ?? [])
    }
    
    private func configureTags(with genres: [Genre]) {
        let content = TTGTextTagStringContent.init()
        content.textColor = Theme.light
        content.textFont = UIFont(name: Fonts.poppinsRegular, size: 16) ?? UIFont.systemFont(ofSize: 16)
        
        let normalStyle = TTGTextTagStyle.init()
        normalStyle.backgroundColor = Theme.dark
        normalStyle.cornerRadius = 12
        normalStyle.borderColor = Theme.grey200
        normalStyle.borderWidth = 0.5
        normalStyle.extraSpace = CGSize.init(width: 20, height: 14)
        
        let selectedStyle = TTGTextTagStyle.init()
        selectedStyle.backgroundColor = Theme.green200_50
        selectedStyle.cornerRadius = 12
        selectedStyle.borderColor = Theme.light
        selectedStyle.borderWidth = 0.5
        selectedStyle.extraSpace = CGSize.init(width: 20, height: 14)
        
        for text in genres {
            let tag = TTGTextTag.init()
            content.text = text.name
            tag.content = content
            tag.style = normalStyle
            tag.selectedStyle = selectedStyle
            
            filterModalView?.collectionView.addTag(tag)
        }
        
        filterModalView?.collectionView.reload()
    }
}

extension FilterModalVC: TTGTextTagCollectionViewDelegate {
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTap tag: TTGTextTag!, at index: UInt) {
        interactor?.updateSelectedGenres(index: Int(index))
    }
}

extension FilterModalVC: FilterModalPresenterOutput {
    func presenter(didRetrieveGenres genres: [Genre]) {
        configureTags(with: genres)
    }
    
    func presenter(didFailRetrieveGenres message: String) {
        print(message)
    }
}
