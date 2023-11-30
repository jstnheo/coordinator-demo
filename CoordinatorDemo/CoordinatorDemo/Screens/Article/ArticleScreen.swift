//
//  ArticleScreen.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct ArticleScreen: View {
    
    @ObservedObject private(set) var viewModel: ArticleScreenViewModel
    
    init(viewModel: ArticleScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
            } else {
                Text(viewModel.articleTitle)
                    .foregroundColor(.black)
                    .padding()
                
                Text(viewModel.articleBody)
                    .foregroundColor(.gray)
                    .padding()
                
                Button("Reload Random Artcile") {
                    let randomNumber = generateRandomNumberString(count: 7)
                    self.viewModel.fetchArticle(id: randomNumber)
                }
            }
        }
        .navigationTitle("\(viewModel.articleNumber)")
    }
}

//struct ArticleScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleScreen(viewModel: ArticleScreenViewModel(articleService: PreviewArticleService(), articleNumber: "1234567"))
//    }
//    
//    private class PreviewArticleService: HTTPClient {
//        func fetchArticle(id: String) async -> Article {
//            return Article(title: "Preview Title",
//                           body: "Preview Body, Preview Body, Preview Body, Preview Body, Preview Body, Preview Body, Preview Body, Preview Body, Preview Body, Preview Body, Preview Body, Preview Body, Preview Body")
//        }
//    }
//}
