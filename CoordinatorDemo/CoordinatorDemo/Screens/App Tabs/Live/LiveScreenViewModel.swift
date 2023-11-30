//
//  LiveScreenViewModel.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import Foundation

final class LiveScreenViewModel: ObservableObject {
    deinit {
        print("Deinit \(String(describing: type(of: self)))")
    }
}
