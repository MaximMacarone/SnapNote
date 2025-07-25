//
//  NotesHostingController.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 22.06.2025.
//

import SwiftUI
import UIKit

protocol NotesControllerDelegate: AnyObject {
    func showSearchScreen()
    func showNewSnapScreen()
}

class NotesHostingController: HostingController<NotesView, NotesView.NotesViewModel> {
    
    weak var delegate: NotesControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
}

private extension NotesHostingController {
    
    //MARK: - VC setup
    
    func setup() {
        
        navigationItem.title = "SnapNote"
        
        let searchBarButton = UIBarButtonItem(systemItem: .search)
        searchBarButton.target = self
        searchBarButton.action = #selector(handleSearchButtonTapped)
        
        let newSnapBarButton = UIBarButtonItem(systemItem: .add)
        newSnapBarButton.target = self
        newSnapBarButton.action = #selector(handleNewSnapButtonTapped)
        
        navigationItem.setRightBarButtonItems([searchBarButton, newSnapBarButton], animated: true)
        
    }
    
    //MARK: - BarButton actions
    
    @objc
    func handleSearchButtonTapped() {
        delegate?.showSearchScreen()
    }
    
    @objc
    func handleNewSnapButtonTapped() {
        delegate?.showNewSnapScreen()
    }
    
}
