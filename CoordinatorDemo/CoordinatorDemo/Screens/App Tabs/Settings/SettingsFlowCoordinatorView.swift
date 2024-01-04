//
//  SettingsFlowCoordinatorView.swift
//  CoordinatorDemo
//
//  Created by Justin H on 11/30/23.
//

import SwiftUI

struct SettingsFlowCoordinatorView: View {
    
    @ObservedObject private var coordinator: SettingsFlowCoordinator
    
    init(coordinator: SettingsFlowCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        
        NavigationStack(path: $coordinator.path) {
            coordinator.build(settingsFlow: .settings)
                .navigationDestination(for: SettingsFlow.self) { screen in
                    coordinator.build(settingsFlow: screen)
                }
             
        }
        .sheet(item: $coordinator.profileFlowCoordinator) { profileCoordinator in
            
            ProfileFlowCoordinatorView(coordinator: profileCoordinator)
            
        }
        
    }
}
