//
//  AboutHostingController.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 24.06.2025.
//

import SwiftUI
import UIKit

protocol AboutControllerDelegate: AnyObject {
    
}

class AboutHostingController: HostingController<AboutView, AboutView.AboutViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
}

private extension AboutHostingController {
    func setup() {
        title = "About"
    }
}
