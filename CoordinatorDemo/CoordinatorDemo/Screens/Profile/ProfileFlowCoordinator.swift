//
//  ProfileFlowCoordinator.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI
import Combine

// Enum to identify Settings flow screen Types
enum ProfileFlow: Hashable {
    case main
    case article(String)
}

final class ProfileFlowCoordinator: ObservableObject, Identifiable {
    
    @Published var path = NavigationPath()
    
    var subscriptions = Set<AnyCancellable>()
    
    private(set) var closeButtonPublisher = PassthroughSubject<Void, Never>()
    
    private var articleService: ArticleService
    
    init(articleService: ArticleService) {
        self.articleService = articleService
    }

    func push(_ profileFlow: ProfileFlow) {
        path.append(profileFlow)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func finish() {
        closeButtonPublisher.send()
    }
    
    @ViewBuilder
    func build(profileFlow: ProfileFlow) -> some View {
        switch profileFlow {
        case .main:
            mainProfileView()
        case .article(let id):
            buildArticleScreen(id: id)
        }
    }
    
    // MARK: View Creation Methods
    
    private func mainProfileView() -> some View {
        let viewModel = ProfileViewModel()
        
        viewModel.articleScreenPublisher
            .sink { [weak self] articleId in
                self?.push(.article(articleId))
            }.store(in: &subscriptions)
        
        let view = ProfileScreen(viewModel: viewModel)
        
        return view
    }
    
    private func buildArticleScreen(id: String) -> some View {
        let viewModel = ArticleScreenViewModel(articleService: articleService, articleNumber: id)
        return ArticleScreen(viewModel: viewModel)
    }
}
