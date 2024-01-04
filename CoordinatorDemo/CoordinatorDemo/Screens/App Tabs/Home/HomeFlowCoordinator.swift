//
//  HomeFlowCoordinator.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI
import Combine

// Enum to identify Home flow screen Types
enum HomeFlow: Hashable {
    case main
    case article(String)
    case detail
}

final class HomeFlowCoordinator: ObservableObject, Identifiable {
    
    @Published var path = NavigationPath()
    
    var subscriptions = Set<AnyCancellable>()
    var cancellable: AnyCancellable?
    
    private var articleService: ArticleService
        
    init(articleService: ArticleService) {
        self.articleService = articleService
    }
    
    func push(_ homeFlow: HomeFlow) {
        path.append(homeFlow)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder
    func build(homeFlow: HomeFlow) -> some View {
        switch homeFlow {
        case .main:
            buildMain()
        case .article(let id):
            buildArticleScreen(id: id)
        case .detail:
            buildDetailsScreen()
        }
    }
    
    // MARK: View Creation Methods
    
    private func buildMain() -> some View {
        let viewModel = HomeScreenViewModel()
        
        viewModel.articleIdToDisplayPublisher.sink { [weak self] id in
            self?.push(.article(id))
        }.store(in: &subscriptions)
        
        viewModel.displayDetailPublisher.sink { [weak self] in
            self?.push(.detail)
        }.store(in: &subscriptions)
        
        return HomeScreen(viewModel: viewModel)
    }

    private func buildArticleScreen(id: String) -> some View {
        let viewModel = ArticleScreenViewModel(articleService: articleService, articleNumber: id)
        return ArticleScreen(viewModel: viewModel)
    }
    
    private func buildDetailsScreen() -> some View {
        let viewModel = DetailsScreenViewModel()
        
        viewModel.backPublisher.sink { [weak self] in
            self?.pop()
        }.store(in: &subscriptions)
        
        return DetailsScreen(viewModel: viewModel)
    }
}
