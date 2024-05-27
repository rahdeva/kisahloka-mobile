//
//  RegisterPageViewModel.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 25/05/24.
//

import Foundation

enum FormFieldFocusRegister{
    case name
    case email
    case dateBirth
    case gender
    case password
    case confirmPassword
}

enum Gender {
    case male
    case female
}

class RegisterPageViewModel: ObservableObject {
    @Published var nameInput: String = ""
    @Published var emailInput: String = ""
    @Published var passwordInput: String = ""
    @Published var confirmPasswordInput: String = ""
    @Published var isSecure: Bool = true
    @Published var isSecure2: Bool = true
    @Published var birthDate: Date = Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1)) ?? Date()
    @Published var genderInput: Gender = .male
    
    var dateRange: ClosedRange<Date> {
        let startDate = Calendar.current.date(from: DateComponents(year: 1900))!
        let endDate = Date()
        return startDate...endDate
    }
    
    func signUpWithEmail(){
        let authManager : AuthManager = AuthManager.init()
        authManager.createAccount(
            withEmail: emailInput,
            password: passwordInput,
            completion: { error in
                self.handleAuthenticationResult(error)
            }
        )
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
    
//    func addUser() {
//        guard let url = URL(string: BaseURL.user) else {
//            print("Invalid URL")
//            return
//        }
//        
//        let session = AppURLSession().getBasicURLSession()
//        
//        session.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching data: \(error)")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//            
//            do {
//                if let homeResponse = try? JSONDecoder().decode(ResponseDataHome.self, from: data) {
//                    if let home = homeResponse.data {
//                        DispatchQueue.main.async {
//                            self.typesData = home.story_types ?? []
//                        }
//                    } else {
//                        print("No types data available")
//                    }
//                } else {
//                    print("Error decoding JSON")
//                }
//            }
//        }.resume()
//    }
//    
//    func addUser() {
//        guard let url = URL(string: BaseURL.user) else {
//            print("Invalid URL")
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let newUser = User(
//            uid: "17Lv7R0Ly3YLX2TJ6YmO6ScSUeW2",
//            roleID: 2,
//            email: "devyahiko@gmail.com",
//            name: "Yahiko",
//            birthDate: "2000-05-12T21:04:59Z",
//            gender: "Male"
//        )
//        
//        do {
//            let jsonData = try JSONEncoder().encode(newUser)
//            request.httpBody = jsonData
//        } catch {
//            print("Error encoding JSON: \(error)")
//            return
//        }
//        
//        let session = AppURLSession().getBasicURLSession()
//        
//        session.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error fetching data: \(error)")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//            
//            do {
//                if let homeResponse = try? JSONDecoder().decode(ResponseDataHome.self, from: data) {
//                    if let home = homeResponse.data {
//                        DispatchQueue.main.async {
//                            self.typesData = home.story_types ?? []
//                        }
//                    } else {
//                        print("No types data available")
//                    }
//                } else {
//                    print("Error decoding JSON")
//                }
//            }
//        }.resume()
//    }

}
