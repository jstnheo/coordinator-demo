//
//  ProfileScreen.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject private(set) var viewModel: ProfileViewModel
    @State var name: String = ""
    @State var email: String = ""
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            List {
                TextField("Name", text: $name)
                
                TextField("Email", text: $email)
                
                Button("Random Article") {
                    viewModel.didTapRandomArticle()
                }
                
            }
        }

    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(viewModel: ProfileViewModel())
    }
}
