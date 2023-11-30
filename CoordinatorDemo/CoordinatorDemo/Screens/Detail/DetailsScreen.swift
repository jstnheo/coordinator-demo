//
//  DetailsScreen.swift
//  CoordinatorDemo
//
//  Created by Justin Heo on 11/21/23.
//

import SwiftUI

struct DetailsScreen: View {
    
    @ObservedObject var viewModel: DetailsScreenViewModel

    var body: some View {
        VStack {
            Text(viewModel.detailsTitle)
            Button("BACK") {
                viewModel.back()
            }
        }
    }
}

//struct DetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsScreen(viewModel: DetailsScreenViewModel())
//    }
//}
