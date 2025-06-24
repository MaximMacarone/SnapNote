//
//  NotesView.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 18.06.2025.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel: NotesViewModel
    
    var body: some View {
        ScrollView {
            Text("Notes screen")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: UIColor.Background.main))
    }
}

#Preview {
    NotesView(viewModel: .init())
}
