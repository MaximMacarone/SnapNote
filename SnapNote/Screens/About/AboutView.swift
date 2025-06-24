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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: UIColor.Background.main))
        //.navigationBarBackButtonHidden()
    }
}

#Preview {
    AboutView(viewModel: .init())
}
