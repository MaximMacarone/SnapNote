//
//  HomeCoordinator.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 18.06.2025.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    
    func onMainCoordinatorCompleted(coordinatorID: UUID)
    
}

enum TabBarNavigationState: Int {
    case notes
    case about
}

class MainCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MainCoordinatorDelegate?
    
    override func start() {
        
        presenter.setNavigationBarHidden(true, animated: false)
        
        showTabBarView()
    }
    
    deinit {
        print("Main coordinator deinit")
    }
    
}

private extension MainCoordinator {
    
    func showTabBarView() {
        let notesCoordinator = configureNotesCoordinator()
        let aboutCoordinator = configureAboutCoordinator()
        
        let controllers: [UIViewController] = [
            notesCoordinator.presenter,
            aboutCoordinator.presenter
        ]
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(controllers, animated: false)
        
        presenter.setViewControllers([tabBarController], animated: true)
    }
}

private extension MainCoordinator {
    
    func configureNotesCoordinator() -> NotesCoordinator {
        
        let flowPresenter = UINavigationController()
        
        flowPresenter.tabBarItem = UITabBarItem(
            tabBarSystemItem: .bookmarks,
            tag: TabBarNavigationState.notes.rawValue
        )
        
        let homeCoordinator = NotesCoordinator(presenter: flowPresenter)
        homeCoordinator.start()
        
        self.store(coordinator: homeCoordinator)
        
        return homeCoordinator
        
    }
    
    func configureAboutCoordinator() -> AboutCoordinator {
        let flowPresenter = UINavigationController()
        
        flowPresenter.tabBarItem = UITabBarItem(
            tabBarSystemItem: .more,
            tag: TabBarNavigationState.about.rawValue
        )
        
        let aboutCoordinator = AboutCoordinator(presenter: flowPresenter)
        aboutCoordinator.delegate = self
        
        aboutCoordinator.start()
        
        self.store(coordinator: aboutCoordinator)
        
        return aboutCoordinator
    }
}

extension MainCoordinator: AboutCoordinatorDelegate {
    func onAboutCoordinatorDidFinish(coordinatorID: UUID) {
        delegate?.onMainCoordinatorCompleted(coordinatorID: self.id)
    }
    
    
}
