//
//  AuthNavDelegate.swift
//  SnapNote
//
//  Created by Maxim Makarenkov on 17.06.2025.
//


protocol AuthNavDelegate: AnyObject {
    func onAuthSignInTapped()
    func onAuthSignInSuccess()
    func onAuthSignInFailed()
}
