//
//  BaseViewModel.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//

import UIKit

class BaseViewModel {
    
    weak var hostingController: UIViewController?
    
    ///Delegate for implementing dismiss logic
    weak var controllerDismissDelegate: ControllerDismissDelegate?
}
