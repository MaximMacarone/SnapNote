//
//  AppCoordinator.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import UIKit
import SwiftUI

class AppCoordinator: BaseCoordinator<UINavigationController> {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        let presenter = UINavigationController()
        
        super.init(presenter: presenter)
        
        self.window.overrideUserInterfaceStyle = .dark
        
        UINavigationBar.setAppearance()
        UITabBar.setAppearance()
        
        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        startAuth()
    }
    
}

// MARK: - Flows
private extension AppCoordinator {
    func startAuth() {
        let authCoordinator = AuthCoordinator(presenter: presenter)
        authCoordinator.delegate = self
        
        authCoordinator.start()
        
        self.store(coordinator: authCoordinator)
    }
    
    func startMain() {
        
        let mainCoordinator = MainCoordinator(presenter: presenter)
        mainCoordinator.delegate = self
        
        mainCoordinator.start()
        
        self.store(coordinator: mainCoordinator)
    }
}

extension AppCoordinator: AuthCoordinatorDelegate {
    func onAuthCoordinationCompleted(coordinatorID: UUID) {
        
        startMain()
        
        self.free(coordinatorID: coordinatorID)
    }
    
    
}

extension AppCoordinator: MainCoordinatorDelegate {
    
    func onMainCoordinatorCompleted(coordinatorID: UUID) {
        
        startAuth()
        
        self.free(coordinatorID: coordinatorID)
    }
    
}
