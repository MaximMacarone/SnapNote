//
//  NewSnapView.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 21.06.2025.
//

import SwiftUI

struct NewSnapView: View {
    
    @StateObject var viewModel: NewSnapViewModel
    
    var body: some View {
        VStack(spacing: 18) {
            Button("Snap from photo library") {
                
            }
            Button("Snap from website") {
                
            }
            Button("Snap from photo") {
                
            }
            Button("Snap manually") {
                
            }
        }
    }
}

#Preview {
    NewSnapView(viewModel: .init())
}
