//
//  UITabBarAppearance.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 25.06.2025.
//

import UIKit

extension UITabBar {
    static func setAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()

        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.secondaryLabel,
            .font: UIFont.systemFont(ofSize: 12, weight: .light, width: .expanded)
        ]
        appearance.stackedLayoutAppearance.normal.iconColor = .secondaryLabel
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes

        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 12, weight: .light, width: .expanded)
        ]
        appearance.stackedLayoutAppearance.selected.iconColor = .label
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes

        UITabBar.appearance().standardAppearance = appearance
    }
}
