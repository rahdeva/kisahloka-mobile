//
//  AuthPageViewModel.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import Foundation
import FirebaseAuth
import SwiftData

class AuthPageViewModel: ObservableObject{
    @Published var selectedTab: Tabs = .home
    @Published var isLoading = false
    
    func signInAnonymous(context: ModelContext){
        isLoading = true
        let authManager = AuthManager()
        
        authManager.signInAnonymously { error in
            if let error = error {
                DispatchQueue.main.async {
                    self.handleAuthenticationResult(error)
                }
            } else {
                if let user = Auth.auth().currentUser {
                    let uid = user.uid
                    print("User signed in with UID: \(uid)")
                    self.addUserAnonymous(uid: uid, context: context)
                } else {
                    DispatchQueue.main.async {
                        let error = NSError(domain: "AuthError", code: -1, userInfo: [
                            NSLocalizedDescriptionKey: "Failed to get current user after anonymous sign-in"
                        ])
                        self.handleAuthenticationResult(error)
                        self.isLoading = false
                    }
                }
            }
        }
    }
    
    func addUserAnonymous(uid: String, context: ModelContext) {
        let authManager = AuthManager()
        
        guard let url = URL(string: BaseURL.user) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userRequest = UserRequestAnonymous(
            uid: uid,
            role_id: 2
        )
        
        do {
            let jsonData = try JSONEncoder().encode(userRequest)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error adding bookmark: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                if let addUserResponse = try? JSONDecoder().decode(ResponseAddUser.self, from: data) {
                    DispatchQueue.main.async {
                        let user_id_anonymous = addUserResponse.data?.userID
                        print("User added successfully: \(addUserResponse)")
                        let userDetail = UserData(
                            user_id: user_id_anonymous,
                            uid: uid,
                            role_id: 2
                        )
                        print("User Anonymous: \(userDetail)")
                        
                        // Save user details asynchronously
                        authManager.saveAuthDataAnonymous(
                            user: userDetail,
                            context: context
                        )
                    }
                } else {
                    print("Error decoding JSON response")
                }
            }
        }.resume()
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
