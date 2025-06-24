//
//  NotesCoordinator.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 18.06.2025.
//

import SwiftUI
import UIKit

class NotesCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showNotesScreen()
    }
    
    deinit {
        print("Notes coordinator deinit")
    }
    
}

extension NotesCoordinator {
    
    func showNotesScreen() {
        let notesViewModel = NotesView.NotesViewModel()
        let notesView = NotesView(viewModel: notesViewModel)
        
        notesViewModel.controllerDismissDelegate = self
        
        let notesViewController = NotesHostingController(rootView: notesView, viewModel: notesViewModel)
        
        notesViewController.notesDelegate = self

        presenter.pushViewController(notesViewController, animated: true)
    }
}


extension NotesCoordinator: SearchCoordinatorDelegate {
    
    func onSearchCoordinatorFinished(coordinatorID: UUID) {
        self.free(coordinatorID: coordinatorID)
    }
    
}

extension NotesCoordinator: ControllerDismissDelegate {
    func backButtonTapped() {
        
    }
    
    func viewDidDissmiss() {
        
    }
    
    
}

extension NotesCoordinator: NotesControllerDelegate {
    func showSearchScreen() {
        let searchPresenter = UINavigationController()
        
        let searchCoordinator = SearchCoordinator(presenter: searchPresenter)
        
        searchPresenter.presentationController?.delegate = self
        
        searchCoordinator.start()
        presenter.present(searchPresenter, animated: true)
        
        self.store(coordinator: searchCoordinator)
    }
    
    func showNewSnapScreen() {
        showNewSnap()
    }
    
    
}

extension NotesCoordinator: NewSnapCoordinating {
    
}

extension NotesCoordinator: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        
        self.freeAllChildCoordinators()
        
    }
}
