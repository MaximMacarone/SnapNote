//
//  AuthViewModel.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import Combine
import SwiftUI

extension AuthView {
    
    class AuthViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: AuthNavDelegate?
        
    }
    
}

//MARK: - Actions
extension AuthView.AuthViewModel {
    func onSignInTapped() {
        navDelegate?.onAuthSignInTapped()
    }
    
    func onSignInSuccess() {
        navDelegate?.onAuthSignInSuccess()
    }
}
