//
//  ProfileFlowCoordinatorView.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct ProfileFlowCoordinatorView: View {
    @ObservedObject private var coordinator: ProfileFlowCoordinator
    
    init(coordinator: ProfileFlowCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(profileFlow: .main)
                .navigationDestination(for: ProfileFlow.self) { screen in
                    coordinator.build(profileFlow: screen)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.coordinator.finish()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.blue)
                                .font(.title)
                        }
                    }
                }
        }
    }
}
