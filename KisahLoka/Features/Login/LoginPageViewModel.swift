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
}
