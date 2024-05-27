//
//  UserData.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 27/05/24.
//

import Foundation
import SwiftData

@Model
class UserData {
    @Attribute var user_id: Int?
    @Attribute var uid: String?
    @Attribute var role_id: Int?
    @Attribute var email: String?
    @Attribute var name: String?
    @Attribute var birth_date: String?
    @Attribute var gender: String?

    init(
         user_id: Int? = nil,
         uid: String? = nil,
         role_id: Int? = nil,
         email: String? = nil,
         name: String? = nil,
         birth_date: String? = nil,
         gender: String? = nil
    ) {
        self.user_id = user_id
        self.uid = uid
        self.role_id = role_id
        self.email = email
        self.name = name
        self.birth_date = birth_date
        self.gender = gender
    }
}
