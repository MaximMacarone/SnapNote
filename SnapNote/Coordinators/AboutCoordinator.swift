//
//  AboutCoordinator.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 18.06.2025.
//

import SwiftUI
import UIKit

protocol AboutCoordinatorDelegate: AnyObject {
    func onAboutCoordinatorDidFinish(coordinatorID: UUID)
}

class AboutCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: AboutCoordinatorDelegate?
    
    override func start() {
        showAboutScreen()
    }
    
    deinit {
        print("About Coordinator deinit")
    }
    
}

private extension AboutCoordinator {
    
    func showAboutScreen() {
        let aboutViewModel = AboutView.AboutViewModel()
        let aboutView = AboutView(viewModel: aboutViewModel)
        
        aboutViewModel.navDelegate = self
        
        let aboutViewController = UIHostingController(rootView: aboutView)
        
        aboutViewController.title = "About"

        presenter.pushViewController(aboutViewController, animated: true)
    }
    
}

extension AboutCoordinator: AboutNavDelegate {
    func onAboutLogOutTapped() {
        delegate?.onAboutCoordinatorDidFinish(coordinatorID: self.id)
    }
    
    func onAboutAddShortcutTapped() {
        
    }
    
}
