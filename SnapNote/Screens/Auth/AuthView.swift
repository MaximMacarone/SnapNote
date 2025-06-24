//
//  AuthView.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var viewModel: AuthViewModel
    
    var body: some View {
        Text("SnapNote")
        Button("Sign In with Apple") {
            //MARK: - Perform Apple Auth
            viewModel.onSignInTapped()
        }
    }
}

#Preview {
    AuthView(viewModel: .init())
}
