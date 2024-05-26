//
//  LoginPageViewModel.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import Foundation

enum FormFieldFocusLogin{
    case email
    case password
}

class LoginPageViewModel: ObservableObject {
    @Published var emailInput: String = ""
    @Published var passwordInput: String = ""
    @Published var isSecure: Bool = true
    
    func signInWithEmail(){
        let authManager : AuthManager = AuthManager.init()
        authManager.signInWithEmail(
            withEmail: emailInput,
            password: passwordInput,
            completion: { error in
                self.handleAuthenticationResult(error)
            }
        )
    }
    
    private func handleAuthenticationResult(_ error: Error?) {
        if let error = error {
            // Handle sign-in error
            print("Sign-in error: \(error.localizedDescription)")
        } else {
            print("Signed in successfully!")
        }
        // Show result
    }
}
