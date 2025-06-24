//
//  AuthProcessingNavDelegate.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//


protocol AuthProcessingNavDelegate: AnyObject {
    func onAuthProcessingCompleted()
    func onAuthProcessingFailed()
}
