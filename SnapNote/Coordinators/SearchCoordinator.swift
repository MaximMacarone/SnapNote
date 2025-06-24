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
        searchViewModel.controllerDismissDelegate = self
        
        let searchViewController = HostingController(rootView: searchView, viewModel: searchViewModel)
        
        searchViewController.title = "Search"
        

        presenter.pushViewController(searchViewController, animated: true)
    }
    
    @objc
    func didTapBackButton() {
        
    }
}

extension SearchCoordinator: SearchNavDelegate {
    func onSearchBackTapped() {
        
    }
    
    func onSearchMoveTapped() {
        
        let homePresenter = UINavigationController()
        let homeCoordinator = NotesCoordinator(presenter: homePresenter)
        
        homePresenter.presentationController?.delegate = self
        
        homeCoordinator.start()
        
        presenter.present(homePresenter, animated: true)
        
        self.store(coordinator: homeCoordinator)
    }
    
    
}

extension SearchCoordinator: ControllerDismissDelegate {
    func backButtonTapped() {
        delegate?.onSearchCoordinatorFinished(coordinatorID: self.id)
    }
    
    func viewDidDissmiss() {
        delegate?.onSearchCoordinatorFinished(coordinatorID: self.id)
    }
}

extension SearchCoordinator: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        
        self.freeAllChildCoordinators()
        
    }
}
