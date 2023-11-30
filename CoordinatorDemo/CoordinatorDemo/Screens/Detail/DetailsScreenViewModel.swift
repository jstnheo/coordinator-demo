//
//  DetailsScreenViewModel.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import Foundation
import Combine

final class DetailsScreenViewModel: ObservableObject {
    @Published var detailsTitle: String = "THIS IS DETAILS"
        
    private(set) var backPublisher = PassthroughSubject<Void, Never>()
    
    init() {
        print("Init \(String(describing: type(of: self)))")
    }
    
    deinit {
        print("Deinit \(String(describing: type(of: self)))")
    }
    
    func back() {
        backPublisher.send()
    }
}
