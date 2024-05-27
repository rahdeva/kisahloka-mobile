//
//  LoginPageViewModel.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import Foundation
import FirebaseAuth
import SwiftData

enum FormFieldFocusLogin{
    case email
    case password
}

class LoginPageViewModel: ObservableObject {
    @Published var emailInput: String = ""
    @Published var passwordInput: String = ""
    @Published var isSecure: Bool = true
    @Published var detailUserData: User?
    @Published var detailUserResponse: ResponseDataUserDetail?
    
    func signInWithEmail(context: ModelContext) {
        let authManager: AuthManager = AuthManager.init()
        authManager.signInWithEmail(
            withEmail: emailInput,
            password: passwordInput,
            completion: { error in
                if let error = error {
                    self.handleAuthenticationResult(error)
                } else {
                    if let user = Auth.auth().currentUser {
                        let uid = user.uid
                        print("User signed in with UID: \(uid)")
                        self.getUserDetail(uid: uid) { userDetail in
                            if let userDetail = userDetail {
                                self.detailUserData = userDetail
                                authManager.saveAuthData(
                                    user: self.detailUserData!,
                                    context: context
                                )
//                                print("detailUserData")
//                                print(self.detailUserData?.name)
//                                print("authManager.currentUser?.name")
//                                print(authManager.currentUser?.name)
                                // Handle successful authentication and UID as needed
                                self.handleAuthenticationResult(nil)
                            } else {
                                print("Error: UserData is nil")
                                self.handleAuthenticationResult(
                                    NSError(
                                        domain: "AuthError",
                                        code: -1, 
                                        userInfo: [
                                            NSLocalizedDescriptionKey: "Failed to fetch user details"
                                        ]
                                    )
                                )
                            }
                        }
                    }
                }
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
    
    func getUserDetail(uid: String, completion: @escaping (User?) -> Void) {
        print(uid)
        print("uid")
        guard let url = URL(string: BaseURL.userByUID(uid: uid)) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let session = AppURLSession().getBasicURLSession()
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let detailUserResponse = try JSONDecoder().decode(ResponseDataUserDetail.self, from: data)
                if let detailUser = detailUserResponse.data {
                    DispatchQueue.main.async {
                        completion(detailUser.user)
                    }
                } else {
                    print("No user data available")
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
