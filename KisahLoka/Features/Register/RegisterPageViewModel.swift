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
}
