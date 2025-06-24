//
//  ControllerDismissDelegate.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 21.06.2025.
//


///Conform for implement logic when:
protocol ControllerDismissDelegate: AnyObject {
    
    ///Pushed view did popped
    func backButtonTapped()
    
    ///Presented view did dismiss
    func viewDidDissmiss()
}
