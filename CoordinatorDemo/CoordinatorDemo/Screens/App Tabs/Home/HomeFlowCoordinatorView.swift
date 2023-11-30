//
//  HomFlowCoordinatorView.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct HomeFlowCoordinatorView: View {
        
    @ObservedObject private var coordinator: HomeFlowCoordinator
    
    init(coordinator: HomeFlowCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        
        NavigationStack(path: $coordinator.path) {
        
            coordinator.build(homeFlow: .main)
                .navigationDestination(for: HomeFlow.self) { screen in
                    coordinator.build(homeFlow: screen)
                }
            
        }

    }
}
