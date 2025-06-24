//
//  AuthProcessingScren.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import Combine
import SwiftUI


extension AuthProcessingView {
    
    class AuthProcessingViewModel: BaseViewModel, ObservableObject {
        
        @Published var isLoading: Bool = true
        @Published var showAlert: Bool = false
        
        var alertTitle = "Auth did completed"
        var alertMessage = "Auth did completed"
        
        weak var authProcessingNavDelegate: AuthProcessingNavDelegate?
    }
}

//MARK: - Actions
extension AuthProcessingView.AuthProcessingViewModel {
    func onAuthProcessingCompleted() {
        isLoading = false
        showAlert = true
        authProcessingNavDelegate?.onAuthProcessingCompleted()
    }
    
    func startAuthProcessing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.onAuthProcessingCompleted()
        }
    }
}
