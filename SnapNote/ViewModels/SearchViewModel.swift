//
//  SearchViewModel.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 19.06.2025.
//

import UIKit
import SwiftUI

protocol SearchNavDelegate: AnyObject {
    
    func onSearchMoveTapped()
}

extension SearchView {
    
    class SearchViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: SearchNavDelegate?
        
    }
    
}


extension SearchView.SearchViewModel {
    
    func onMoveTapped() {
        navDelegate?.onSearchMoveTapped()
    }
    
}
