//
//  SettingsScreenViewModel.swift
//  CoordinatorPatternDemo
//
//  Created by Justin Heo on 11/11/23.
//

import Foundation
import Combine

final class SettingsScreenViewModel: ObservableObject {
 
    private(set) var profileScreenPublisher = PassthroughSubject<Void, Never>()
    private(set) var articleScreenPublisher = PassthroughSubject<String, Never>()
    private(set) var detailsScreenPublisher = PassthroughSubject<String, Never>()

    init() {
        print("Init \(String(describing: type(of: self)))")
    }
    
    deinit {
        print("Deinit \(String(describing: type(of: self)))")
    }
    
    func didTapProfile() {
        profileScreenPublisher.send()
    }
    
    func didTapRandomArticle() {
        let randomNumber = generateRandomNumberString(count: 7)
        articleScreenPublisher.send(randomNumber)
    }
    
    func didTapDetails() {
        detailsScreenPublisher.send("Details from Settings")
    }
}
