//
//  UINavigationBarAppearance.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 25.06.2025.
//

import UIKit

extension UINavigationBar {
    static func setAppearance() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 17, weight: .light, width: .expanded),
        ]
        
        appearance.buttonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 16, weight: .light, width: .expanded),
        ]
        
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.clear
        ]

        appearance.backButtonAppearance = backButtonAppearance
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = .label
        
    }
}
