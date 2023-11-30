//
//  ProfileViewModel.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    
    private(set) var articleScreenPublisher = PassthroughSubject<String, Never>()

    init() {
        print("Init \(String(describing: type(of: self)))")
    }
    
    deinit {
        print("Deinit \(String(describing: type(of: self)))")
    }
    
    func didTapRandomArticle() {
        let randomNumber = generateRandomNumberString(count: 7)
        articleScreenPublisher.send(randomNumber)
    }
}
