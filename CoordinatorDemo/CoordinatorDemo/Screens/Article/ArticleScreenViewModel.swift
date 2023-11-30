//
//  ArticleScreenViewModel.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import Foundation

final class ArticleScreenViewModel: ObservableObject {
    private let articleService: HTTPClient
    
    @Published private(set) var articleNumber: String
    
    @Published private(set) var articleTitle: String = ""
    @Published private(set) var articleBody: String = ""
    @Published private(set) var isLoading: Bool = false
        
    deinit {
        print("Deinit \(String(describing: type(of: self)))")
    }
        
    init(articleService: HTTPClient, articleNumber: String) {
        print("Init \(String(describing: type(of: self)))")
        
        self.articleService = articleService
        self.articleNumber = articleNumber
        
        self.fetchArticle(id: articleNumber)
    }
    
    func fetchArticle(id: String) {
        isLoading = true
        
        Task {
            let article = await articleService.fetchArticle(id: id)
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.articleNumber = id
                self.articleTitle = article.title
                self.articleBody = article.body
            }
        }
    }
}
