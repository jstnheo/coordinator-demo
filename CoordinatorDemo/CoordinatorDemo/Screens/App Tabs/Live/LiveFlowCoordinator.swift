//
//  LiveCoordinator.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI
import Combine

// Enum to identify Settings flow screen Types
enum LiveFlow: String, Identifiable {
    case main
    
    var id: String {
        self.rawValue
    }
}

final class LiveFlowCoordinator: ObservableObject, Identifiable {
    
    @Published var path = NavigationPath()
    
    var subscriptions = Set<AnyCancellable>()
    
    func push(_ liveFlow: LiveFlow) {
        path.append(liveFlow)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(liveFlow: LiveFlow) -> some View {
        switch liveFlow {
        case .main:
            mainLiveView()
        }
    }
    
   // MARK: View Creation Methods
    private func mainLiveView() -> some View {
        let viewModel = LiveScreenViewModel()
        return LiveScreen(viewModel: viewModel)
    }
}
