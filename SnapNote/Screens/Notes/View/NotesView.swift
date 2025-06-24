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
        Text("Notes screen")
    }
}

#Preview {
    NotesView(viewModel: .init())
}
