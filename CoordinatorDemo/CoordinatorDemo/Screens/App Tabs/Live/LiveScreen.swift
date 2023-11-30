//
//  LiveScreen.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct LiveScreen: View {
    
    @ObservedObject private(set) var viewModel: LiveScreenViewModel
        
    init(viewModel: LiveScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.green
            
            Text("Live View")
                .foregroundColor(.black)
        }
        .ignoresSafeArea()
        .navigationTitle("Live Title")
    }
}

struct LiveScreen_Previews: PreviewProvider {
    static var previews: some View {
        LiveScreen(viewModel: LiveScreenViewModel())
    }
}
