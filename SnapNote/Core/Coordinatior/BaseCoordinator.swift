//
//  BaseCoordinator.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import UIKit


class BaseCoordinator<ControllerType: UIViewController>: NSObject {
    
    let id = UUID()
    
    private(set) var childCoordinators = [UUID: Any]()
    
    var presenter: ControllerType
    
    init(presenter: ControllerType) {
        self.presenter = presenter
    }
    
    func start() {
        preconditionFailure("Must override start()")
    }
    
}

// MARK: - Coordinator Management

extension BaseCoordinator {
    
    func store<U>(coordinator: BaseCoordinator<U>) where U: UIViewController {
        let coordExists = childCoordinators.contains { (key, value) -> Bool in
            return key == coordinator.id
        }
        
        if !coordExists {
            childCoordinators[coordinator.id] = coordinator
        }
    }
    
    func free(coordinatorID: UUID) {
        let coordExists = childCoordinators.contains { (key, value) -> Bool in
            return key == coordinatorID
        }
        
        if coordExists {
            childCoordinators[coordinatorID] = nil
        }
    }
    
    func freeAllChildCoordinators() {
        childCoordinators = [UUID: Any]()
    }
    
    func childCoordinator<T>(forKey key: UUID) -> T? {
        return childCoordinators.first(where: { $0.key == key })?.value as? T
    }
    
}

