//
//  TabBarCoordinatorView.swift
//  CoordinatorPatternDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct MainTabView: View {
    
    private let homeFlowCoordinator: HomeFlowCoordinator
    private let liveFlowCoordinator: LiveFlowCoordinator
    private let settingsFlowCoordinator: SettingsFlowCoordinator
    
    init(articleService: ArticleService) {
        self.homeFlowCoordinator = HomeFlowCoordinator(articleService: articleService)
        self.liveFlowCoordinator = LiveFlowCoordinator()
        self.settingsFlowCoordinator = SettingsFlowCoordinator(articleService: articleService)
    }
    
    var body: some View {
        
        TabView {
            HomeFlowCoordinatorView(coordinator: homeFlowCoordinator)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            LiveFlowCoordinatorView(coordinator: liveFlowCoordinator)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Live")
                }
            
            SettingsFlowCoordinatorView(coordinator: settingsFlowCoordinator)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Settings")
                }
            
        }
    }
}
