//
//  SettingsFlowCoordinator.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI
import Combine

// Enum to identify Settings flow screen Types
enum SettingsFlow: Hashable {
    case main
    case article(String)
    case detail
    case profile
}

final class SettingsFlowCoordinator: ObservableObject, Identifiable {
    
    @Published var path = NavigationPath()
    
    // Child Coordinator
    @Published var profileFlowCoordinator: ProfileFlowCoordinator?

    var subscriptions = Set<AnyCancellable>()
        
    private var articleService: ArticleService
    
    init(articleService: ArticleService) {
        self.articleService = articleService
    }

    func push(_ settingsFlow: SettingsFlow) {
        path.append(settingsFlow)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }

    
    @ViewBuilder
    func build(settingsFlow: SettingsFlow) -> some View {
        switch settingsFlow {
        case .main:
            mainSettingsView()
        case .article(let id):
            buildArticleScreen(id: id)
        case .detail:
            mainSettingsView()
        case .profile:
            mainSettingsView()
        }
    }
    
    // MARK: Child Coordinator Methods
    
    private func presentProfileFlowCoordiantor() {
        let profileFlowCoordinator = ProfileFlowCoordinator(articleService: articleService)
        profileFlowCoordinator.closeButtonPublisher.sink { [weak self] in
            self?.profileFlowCoordinator = nil
        }
        .store(in: &subscriptions)
        self.profileFlowCoordinator = profileFlowCoordinator
    }
    
    // MARK: View Creation Methods
    
    private func mainSettingsView() -> some View {
        let viewModel = SettingsScreenViewModel()
        
        viewModel.profileScreenPublisher
            .sink { [weak self] _ in
                self?.presentProfileFlowCoordiantor()
            }.store(in: &subscriptions)
        
        viewModel.articleScreenPublisher
            .sink { [weak self] articleId in
                self?.push(.article(articleId))
            }.store(in: &subscriptions)
        
        viewModel.detailsScreenPublisher
            .sink { [weak self] detailsText in
                print(detailsText)
                self?.push(.detail)
            }.store(in: &subscriptions)
        
        let view = SettingsScreen(viewModel: viewModel)
        return view
    }
    
    private func buildArticleScreen(id: String) -> some View {
        let viewModel = ArticleScreenViewModel(articleService: articleService, articleNumber: id)
        return ArticleScreen(viewModel: viewModel)
    }
    
    private func buildDetailsScreen() -> some View {
        let viewModel = DetailsScreenViewModel()
        return DetailsScreen(viewModel: viewModel)
    }
}
