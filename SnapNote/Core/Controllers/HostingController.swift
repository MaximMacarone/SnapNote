//
//  HostingController.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import UIKit
import SwiftUI

class HostingController<Content: View, ViewModel: BaseViewModel>: UIHostingController<Content> {
    
    var viewModel: ViewModel
    weak var backButtonDelegate: BackButtonDelegate?
    
    init(rootView: Content, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
        viewModel.hostingController = self

    }
    
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.isMovingFromParent {
            self.backButtonDelegate?.backButtonTapped()
        }

    }
    
}
