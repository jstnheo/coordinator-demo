//
//  CoordinatorDemoApp.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

@main
struct CoordinatorDemoApp: App {
    
    let articleService = ArticleService()
    
    var body: some Scene {
        WindowGroup {
            MainTabView(articleService: articleService)
        }
    }
    
}
