//
//  NewSnapCoordinator.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 21.06.2025.
//

import UIKit

protocol NewSnapCoordinating: BaseCoordinator<UINavigationController> {
    
}

extension NewSnapCoordinating {
    
    func showNewSnap() {
        let newSnapViewModel = NewSnapView.NewSnapViewModel()
        let newSnapView = NewSnapView(viewModel: newSnapViewModel)
        
        let newSnapController = HostingController(rootView: newSnapView, viewModel: newSnapViewModel)
        
        newSnapController.modalPresentationStyle = .pageSheet
        
        if let sheet = newSnapController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        
        presenter.present(newSnapController, animated: true)
    }
    
}
