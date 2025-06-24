//
//  UIViewController+Ext.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 19.06.2025.
//

import UIKit

extension UIViewController {
    
    func setBackButtonAction(target: Any?, selector: Selector) {
        
        navigationItem.hidesBackButton = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        let backIcon = UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let backButton = UIBarButtonItem(image: backIcon, style: .plain, target: target, action: selector)
        navigationItem.leftBarButtonItem = backButton
        
    }
    
    func setDismissButtonAction(target: Any?, selector: Selector) {
        
        navigationItem.hidesBackButton = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        let dismissIcon = UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let dismissButton = UIBarButtonItem(image: dismissIcon, style: .plain, target: target, action: selector)
        navigationItem.rightBarButtonItem = dismissButton
        
    }
    
}
