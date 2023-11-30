//
//  ArticleService.swift
//  CoordinatorPatternDemo
//
//  Created by Justin Heo on 11/11/23.
//

import Foundation

protocol HTTPClient {
    func fetchArticle(id: String) async -> Article
}

struct Article {
    let title: String
    let body: String
}

class ArticleService: HTTPClient {
    
    func fetchArticle(id: String) async -> Article {
        try! await Task.sleep(nanoseconds: 1 * 1_000_000_000) // 1 second
        
        let title = "Article: \(id)"
        let body = generateRandomNumberString(count: 100)
        
        return Article(title: title, body: body)
    }
}

func generateRandomNumberString(count: Int) -> String {
    let lowerBound = 0
    let upperBound = 9 // Single-digit numbers
    
    let randomNumbers = (0..<count).map { _ in
        return Int.random(in: lowerBound...upperBound)
    }
    
    let numberString = randomNumbers.map { String($0) }.joined()
    return numberString
}
