//
//  HomeScreenViewModel.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import Foundation
import Combine

final class HomeScreenViewModel: ObservableObject {
    @Published private(set) var homeTitle: String = "Home"
    @Published private (set) var homeButtonText: String = "To Random Article"
    
    private(set) var articleIdToDisplayPublisher = PassthroughSubject<String, Never>()
    private(set) var displayDetailPublisher = PassthroughSubject<Void, Never>()

    deinit {
        print("Deinit \(String(describing: type(of: self)))")
    }
    
    init() {
        print("Init \(String(describing: type(of: self)))")
    }
    
    func showArticle(id: String) {
        articleIdToDisplayPublisher.send(id)
    }
    
    func showDetail() {
        displayDetailPublisher.send()
    }
}
