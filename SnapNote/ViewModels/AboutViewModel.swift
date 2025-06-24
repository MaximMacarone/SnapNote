//
//  AboutViewModel.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 19.06.2025.
//

import Foundation

protocol AboutNavDelegate: AnyObject {
    func onAboutLogOutTapped()
    func onAboutAddShortcutTapped()
}

extension AboutView {
    
    class AboutViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: AboutNavDelegate?
        
    }
    
}

extension AboutView.AboutViewModel {
    func onLogOutTapped() {
        navDelegate?.onAboutLogOutTapped()
    }
    
    func onAddShortcutTapped() {
        navDelegate?.onAboutAddShortcutTapped()
    }
}
