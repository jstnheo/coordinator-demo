//
//  HomeScreen.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject private(set) var viewModel: HomeScreenViewModel
        
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        ZStack {
            Color.cyan
            
            VStack {
                
                List {
                    ForEach(0..<25) { n in
                        Text("\(n)")
                    }
                }
                
                Text(viewModel.homeTitle)
                    .foregroundColor(.black)
                
                Button(viewModel.homeButtonText) {
                    let randomArcticle = generateRandomNumberString(count: 7)
                    self.viewModel.showArticle(id: randomArcticle)
                }
                .buttonStyle(.bordered)
                .tint(.yellow)
                
                
                Button("TO DETAILS") {
                    viewModel.showDetail()
                }
                .buttonStyle(.bordered)
                .tint(.yellow)

            
            }
        }
        .navigationTitle("Home Title")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeScreenViewModel())
    }
}
