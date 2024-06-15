//
//  RegisterPageViewModel.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import Foundation
import FirebaseAuth
import SwiftData

enum FormFieldFocusGuestRegister{
    case name
    case email
    case dateBirth
    case gender
    case password
    case confirmPassword
}

enum GuestGender {
    case male
    case female
}

class GuestRegisterPageViewModel: ObservableObject {
    @Published var nameInput: String = ""
    @Published var emailInput: String = ""
    @Published var passwordInput: String = ""
    @Published var confirmPasswordInput: String = ""
    @Published var isSecure: Bool = true
    @Published var isSecure2: Bool = true
    @Published var birthDate: Date = Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1)) ?? Date()
    @Published var genderInput: Gender = .male
    @Published var isLoading = false
    
    var dateRange: ClosedRange<Date> {
        let startDate = Calendar.current.date(from: DateComponents(year: 1900))!
        let endDate = Date()
        return startDate...endDate
    }
    
    func linkAnonymousWithEmail(userData: UserData?, context: ModelContext) {
        isLoading = true
        let authManager = AuthManager()
        
        print("nameInput: \(nameInput)")
        print("emailInput: \(emailInput)")
        print("passwordInput: \(passwordInput)")
        print("confirmPasswordInput: \(confirmPasswordInput)")
        print("birthDate: \(birthDate)")
        print("genderInput: \(genderInput)")
        
        if nameInput != "" && emailInput != "" && passwordInput != "" && confirmPasswordInput != "" && passwordInput == confirmPasswordInput {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = dateFormatter.string(from: birthDate)
            
            if let user = Auth.auth().currentUser {
                let credential = EmailAuthProvider.credential(withEmail: self.emailInput, password: self.passwordInput)
                user.link(with: credential) { authResult, error in
                    if let error = error {
                        self.handleAuthenticationResult(error)
                        self.isLoading = false
                    } else {
                        let uid = user.uid
                        print("User signed in with UID: \(uid)")
                        self.editUser(
                            user_id: userData?.user_id,
                            uid: uid,
                            email: self.emailInput,
                            name: self.nameInput,
                            birthDate: dateString,
                            gender: self.genderInput == .male ? "Male" : "Female"
                        ) { error in
                            if let error = error {
                                self.handleAuthenticationResult(error)
                            } else {
                                self.getUserDetail(uid: uid) { userDetail in
                                    if let userDetail = userDetail {
                                        authManager.saveAuthData(user: userDetail, context: context)
                                        self.handleAuthenticationResult(nil)
                                    } else {
                                        print("Error: UserData is nil")
                                        self.handleAuthenticationResult(NSError(domain: "AuthError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch user details"]))
                                    }
                                }
                            }
                            self.isLoading = false
                        }
                    }
                }
            }
        } else {
            self.isLoading = false
        }
    }
    
    private func handleAuthenticationResult(_ error: Error?) {
        if let error = error {
            print("Sign-up error: \(error.localizedDescription)")
            // Show error
        } else {
            print("Signed up successfully!")
        }
        // Show result
    }
    
    func editUser(
        user_id: Int?,
        uid: String,
        email: String,
        name: String,
        birthDate: String,
        gender: String,
        completion: @escaping (Error?) -> Void
    ) {
        print(birthDate)
        guard let url = URL(string: BaseURL.user) else {
            print("Invalid URL")
            completion(NSError(domain: "URL Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userRequest = UserRequestEdit(
            user_id: user_id,
            uid: uid,
            role_id: 2,
            email: email,
            name: name,
            birth_date: birthDate,
            gender: gender
        )
        
        do {
            let jsonData = try JSONEncoder().encode(userRequest)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
            completion(error)
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error adding user: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(NSError(domain: "Data Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                return
            }
            
            do {
                if let editUserResponse = try? JSONDecoder().decode(ResponseEditUser.self, from: data) {
                    print("User edit successfully: \(editUserResponse)")
                    completion(nil)
                } else {
                    print("Error decoding JSON response")
                    completion(NSError(domain: "Decoding Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Error decoding JSON response"]))
                }
            }
        }.resume()
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
