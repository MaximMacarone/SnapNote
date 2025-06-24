//
//  TabBarController.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 25.06.2025.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        /// Needed to prevent screen from flashing white/black
        /// when switching tabs
        self.view.backgroundColor = .clear
    }

}
