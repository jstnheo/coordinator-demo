//
//  SettingsScreen.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct SettingsScreen: View {
    
    @ObservedObject private(set) var viewModel: SettingsScreenViewModel
    
    var body: some View {
        VStack {
            List {
                
                Button("Profile") {
                    viewModel.didTapProfile()
                }
                
                Button("Random Article") {
                    viewModel.didTapRandomArticle()
                }
                
                Button("Details") {
                    viewModel.didTapDetails()
                }
                
            }
        }
        .navigationTitle("Settings Title")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen(viewModel: SettingsScreenViewModel())
    }
}
