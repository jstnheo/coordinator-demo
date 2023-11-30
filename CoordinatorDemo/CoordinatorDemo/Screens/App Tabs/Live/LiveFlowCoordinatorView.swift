//
//  LiveFlowCoodinatorView.swift
//  CoordinatorDemo
//
//  Created by Justin H on 11/30/23.
//

import SwiftUI

struct LiveFlowCoordinatorView: View {
    
    @StateObject var coordinator = LiveFlowCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(liveFlow: .main)
                .navigationDestination(for: LiveFlow.self) { screen in
                    coordinator.build(liveFlow: screen)
                }
        }
    }
}

#Preview {
    LiveFlowCoordinatorView()
}
