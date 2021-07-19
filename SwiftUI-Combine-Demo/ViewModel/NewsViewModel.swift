//
//  NewsViewModel.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 19/07/2021.
//

import Foundation
import Combine

protocol NewsViewModelProtocol {
    func getArticles()
}

/// Observable Object this to track the change that happiens to the date in this class

class NewsViewModel:ObservableObject,  NewsViewModelProtocol {
    
    private(set) var articles = [Article]()
    @Published private(set) var state:ResultState = .loading // @Published to start listen to state change
    private var anyCancellable = Set<AnyCancellable>()
    
    var newsService: NewsService
    
    init(service: NewsService) {
        self.newsService = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancelable = newsService.getNewsArticles(for: .getNews)
            .sink { res in
                switch res{
                
                case .finished:
                    // send articals back
                    self.state = .Success(self.articles)
                case .failure(let error):
                    self.state = .Failed(error: error)
                }
            } receiveValue: { [weak self] response in
                guard let self = self else {return}
                self.articles = response.articles ?? []
            }
        
        self.anyCancellable.insert(cancelable)

    }
}
