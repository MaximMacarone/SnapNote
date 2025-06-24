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
        
        let notesViewController = NotesHostingController(rootView: notesView, viewModel: notesViewModel)
        
        notesViewController.delegate = self

        presenter.pushViewController(notesViewController, animated: true)
    }
}


extension NotesCoordinator: SearchCoordinatorDelegate {
    
    func onSearchCoordinatorFinished(coordinatorID: UUID) {
        self.free(coordinatorID: coordinatorID)
    }
    
}

extension NotesCoordinator: NotesControllerDelegate {
    
    func showSearchScreen() {
        
        let searchCoordinator = SearchCoordinator(presenter: presenter)
        
        searchCoordinator.delegate = self
        
        searchCoordinator.start()
        
        self.store(coordinator: searchCoordinator)
    }
    
    func showNewSnapScreen() {
        showNewSnap()
    }
    
}

extension NotesCoordinator: NewSnapCoordinating {}
