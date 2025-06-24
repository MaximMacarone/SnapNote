//
//  SearchCoordinator.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 19.06.2025.
//

import SwiftUI
import UIKit

protocol SearchCoordinatorDelegate: AnyObject {
    func onSearchCoordinatorFinished(coordinatorID: UUID)
}

class SearchCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: SearchCoordinatorDelegate?
    
    override func start() {
        showSearchView()
    }
    
    deinit {
        print("Search coordinator deinit")
    }
}

private extension SearchCoordinator {
    func showSearchView() {
        let searchViewModel = SearchView.SearchViewModel()
        let searchView = SearchView(viewModel: searchViewModel)
        
        searchViewModel.navDelegate = self
        
        let searchViewController = HostingController(rootView: searchView, viewModel: searchViewModel)
        searchViewController.backButtonDelegate = self

        searchViewController.title = "Search"
        
        presenter.pushViewController(searchViewController, animated: true)
    }
}

extension SearchCoordinator: SearchNavDelegate {
    
    func onSearchMoveTapped() {
        
        let notesPresenter = UINavigationController()
        
        let notesCoordinator = NotesCoordinator(presenter: notesPresenter)
        notesCoordinator.start()
        
        presenter.present(notesPresenter, animated: true)
        
        self.store(coordinator: notesCoordinator)
    }
    
}

extension SearchCoordinator: BackButtonDelegate {
    func backButtonTapped() {
        delegate?.onSearchCoordinatorFinished(coordinatorID: self.id)
    }
    
}
