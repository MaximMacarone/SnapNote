//
//  SearchView.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 19.06.2025.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        Text("SearchView")
        Button("smth") {
            viewModel.onMoveTapped()
        }
    }
}

#Preview {
    SearchView(viewModel: .init())
}
