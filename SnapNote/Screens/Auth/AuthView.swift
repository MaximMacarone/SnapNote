//
//  AuthView.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import SwiftUI
import AuthenticationServices

struct AuthView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @StateObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if verticalSizeClass == .regular {
                VStack {
                    Spacer()
                    Text("SnapNote")
                        .fontWidth(.expanded)
                        .font(.system(size: 48))
                        .fontWeight(.light)
                    Spacer()
                    Spacer()
                    SignInWithAppleButton { _ in
                        viewModel.onSignInTapped()
                    } onCompletion: { _ in
                        
                    }
                    .signInWithAppleButtonStyle(.black)
                    .clipShape(.capsule)
                    .frame(width: 200, height: 50)
                    Spacer()
                }
            } else if verticalSizeClass == .compact {
                HStack(alignment: .center) {
                    Spacer()
                    Text("SnapNote")
                        .fontWidth(.expanded)
                        .font(.system(size: 48))
                        .fontWeight(.light)
                    Spacer()
                    SignInWithAppleButton { _ in
                        viewModel.onSignInTapped()
                    } onCompletion: { _ in
                        
                    }
                    .signInWithAppleButtonStyle(.black)
                    .clipShape(.capsule)
                    .frame(width: 200, height: 50)
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: UIColor.Background.main))
    }
}

#Preview {
    AuthView(viewModel: .init())
}
