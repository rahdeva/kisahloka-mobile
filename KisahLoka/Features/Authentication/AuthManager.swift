//
//  AuthManager.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 26/05/24.
//

import SwiftUI
import FirebaseAuth
import SwiftData

class AuthManager: NSObject, ObservableObject {

    // MARK: - Properties

    @Published var isUserLoggedIn = false
    
//    @Published var currentUser: UserData?
//    var userData: UserData? { UserData.self }
//    @Environment(\.modelContext) var context

    // MARK: - Initialization

    override init() {
        super.init()
        setupAuthStateChangeListener()
    }

    // MARK: - Methods

    // MARK: Auth State Change Listener

    /// Sets up the authentication state change listener to track user login status.
    private func setupAuthStateChangeListener() {
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.isUserLoggedIn = user != nil
            }
        }
    }

    // MARK: Sign Out

    /// Signs out the current user.
    /// - Parameter completion: Closure called upon completion with an optional error.
    func signOut(context: ModelContext, completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            // Clear local user data
            clearLocalUserData(context: context)
            completion(nil)
        } catch let signOutError as NSError {
            completion(signOutError)
        }
    }
    
    // MARK: Save Auth Data

    func saveAuthData(user: User, context: ModelContext) {
        clearLocalUserData(context: context)
        let newUser = UserData(
            user_id: user.user_id,
            uid: user.uid,
            role_id: user.role_id,
            email: user.email,
            name: user.name,
            birth_date: user.birth_date,
            gender: user.gender
        )
        if let userID = newUser.user_id {
            print("Current UserID: \(userID)")
        } else {
            print("User ID is nil")
        }

        if let userUID = newUser.uid {
            print("Current UserUID: \(userUID)")
        } else {
            print("User UID is nil")
        }
        
        if let email = newUser.email {
            print("Current Email: \(email)")
        } else {
            print("User Email is nil")
        }
        context.insert(newUser)
    }
    
    func saveAuthDataAnonymous(user: UserData, context: ModelContext) {
        let newUser = UserData(
            user_id: user.user_id,
            uid: user.uid,
            role_id: user.role_id
        )
        if let userID = newUser.user_id {
            print("Current UserID: \(userID)")
        } else {
            print("User ID is nil")
        }

        if let userUID = newUser.uid {
            print("Current UserUID: \(userUID)")
        } else {
            print("User UID is nil")
        }
        
        if let email = newUser.email {
            print("Current Email: \(email)")
        } else {
            print("User Email is nil")
        }
        
        context.insert(newUser)
    }
    
    // MARK: Get Current User
    func getCurrentUser(context: ModelContext) -> UserData? {
        let userDataFetch = FetchDescriptor<UserData>(predicate: nil)
        do {
            let userData: [UserData] = try context.fetch(userDataFetch)
            if let userID = userData.first?.user_id {
                print("Current UserID: \(userID)")
            } else {
                print("User ID is nil")
            }

            if let userUID = userData.first?.uid {
                print("Current UserUID: \(userUID)")
            } else {
                print("User UID is nil")
            }
            if let email = userData.first?.email {
                print("Current Email: \(email)")
            } else {
                print("User Email is nil")
            }
            return userData.first
        } catch {
            print("Failed to fetch current user: \(error)")
            return nil
        }
    }
    
    func sendResetPassword(email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
    func clearLocalUserData(context: ModelContext) {
        let fetchRequest = FetchDescriptor<UserData>(predicate: nil)
        do {
            let userData = try context.fetch(fetchRequest)
            for user in userData {
                context.delete(user)
            }
            // Save changes to the context
            try context.save()
        } catch {
            print("Failed to clear local user data: \(error)")
        }
    }
//
//    Future<void> saveAuthData({required UserData user, required String token}) async {
//        await storage.write(StorageName.USERS, user.toJson());
//        await secureStorage.setToken(value: token);
//    }
//
//    Future<void> changeUserData({required UserData user}) async {
//        await storage.write(StorageName.USERS, user.toJson());
//    }
}

// MARK: - Account Creation and Sign In

extension AuthManager {

    // MARK: Create Account

    /// Creates a new user account with the provided email and password.
    /// - Parameters:
    ///   - email: User's email address.
    ///   - password: User's desired password.
    ///   - completion: Closure called upon completion with an optional error.
    func createAccount(withEmail email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }

    // MARK: Sign In with Email and Password

    /// Signs in the user with the provided email and password.
    /// - Parameters:
    ///   - email: User's email address.
    ///   - password: User's password.
    ///   - completion: Closure called upon completion with an optional error.
    func signInWithEmail(withEmail email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
    // MARK: Sign In Anonymously

    func signInAnonymously(completion: @escaping (Error?) -> Void) {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
}
