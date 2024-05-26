//
//  ProfilePageViewModel.swift
//  KisahLoka
//
//  Created by MacBook Air on 16/05/24.
//

import Foundation

class ProfilePageViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var prefersNotifications: Bool = false
    let authManager : AuthManager = AuthManager.init()
    
    func signOut(){
        authManager.signOut { error in
            if let error = error {
                print("Sign-out error: \(error.localizedDescription)")
                // Show error
            }
        }
    }
}
