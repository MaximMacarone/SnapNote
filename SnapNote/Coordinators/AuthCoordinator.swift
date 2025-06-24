//
//  AuthCoordinator.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import UIKit

protocol AuthCoordinatorDelegate: AnyObject {
    func onAuthCoordinationCompleted(coordinatorID: UUID)
}

class AuthCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: AuthCoordinatorDelegate?
    
    override func start() {
        
        showAuthScreen()
        
        presenter.setNavigationBarHidden(false, animated: true)
    }
    
    deinit {
        print("auth coordinator deinit")
    }
}

//MARK: - Screens
private extension AuthCoordinator {
    func showAuthScreen() {
        let authViewModel = AuthView.AuthViewModel()
        let authView = AuthView(viewModel: authViewModel)
        
        authViewModel.navDelegate = self
        
        let authHostingController = HostingController(rootView: authView, viewModel: authViewModel)
        
        authHostingController.title = "SnapNote Authentication"
        
        presenter.setViewControllers([authHostingController], animated: true)
    }
    
    func showAuthProcessingScreen() {
        let authProcessingViewModel = AuthProcessingView.AuthProcessingViewModel()
        let authProcessingView = AuthProcessingView(viewModel: authProcessingViewModel)
        authProcessingViewModel.authProcessingNavDelegate = self
        
        let authProcessingHostingController = HostingController(rootView: authProcessingView, viewModel: authProcessingViewModel)
        
        authProcessingHostingController.title = "SnapNote Processing Authentication"
        presenter.setViewControllers([authProcessingHostingController], animated: true)
    }
}

//MARK: - Navigation Delegate
extension AuthCoordinator: AuthNavDelegate {
    func onAuthSignInFailed() {
        print("Auth Failed")
        showAuthScreen()
    }
    
    func onAuthSignInTapped() {
        showAuthProcessingScreen()
    }
    
    func onAuthSignInSuccess() {
        delegate?.onAuthCoordinationCompleted(coordinatorID: self.id)
        print("Auth completed")
    }
}

extension AuthCoordinator: AuthProcessingNavDelegate {
    func onAuthProcessingFailed() {
        onAuthSignInFailed()
    }
    
    func onAuthProcessingCompleted() {
        onAuthSignInSuccess()
    }
    
}
