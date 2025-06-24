//
//  AuthProcessingScreen.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import SwiftUI

struct AuthProcessingView: View {
    
    @StateObject var viewModel: AuthProcessingViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .navigationBarBackButtonHidden()
//        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
//            Button("OK") {}
//        }
        .onAppear {
            viewModel.startAuthProcessing()
        }
    }
}

#Preview {
    AuthProcessingView(viewModel: .init())
}
