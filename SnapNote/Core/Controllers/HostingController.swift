//
//  HostingController.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import UIKit
import SwiftUI

class HostingController<Content: View, ViewModel: BaseViewModel>: UIHostingController<Content>, UIAdaptivePresentationControllerDelegate {
    
    var viewModel: ViewModel
    
    init(rootView: Content, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
        viewModel.hostingController = self
        
        presentationController?.delegate = self

    }
    
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.isMovingFromParent {
            self.viewModel.controllerDismissDelegate?.backButtonTapped()
        }
        
        if self.isMovingToParent {
            print("moving to  parent")
        }
    }
    
    //MARK: - UIAdaptivePresentationControllerDelegate
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.viewModel.controllerDismissDelegate?.backButtonTapped()
    }
    
}
