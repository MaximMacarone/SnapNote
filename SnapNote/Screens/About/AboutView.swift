//
//  AboutView.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 18.06.2025.
//

import SwiftUI

struct AboutView: View {
    
    @StateObject var viewModel: AboutViewModel
    
    var body: some View {
        VStack {
            Button("Log Out") {
                viewModel.onLogOutTapped()
            }
        }
        //.navigationBarBackButtonHidden()
    }
}

#Preview {
    AboutView(viewModel: .init())
}
