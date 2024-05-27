//
//  User.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 26/05/24.
//

import Foundation

struct User : Codable {
    let user_id : Int?
    let uid : String?
    let role_id : Int?
    let email : String?
    let name : String?
    let birth_date : String?
    let gender : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case user_id = "user_id"
        case uid = "uid"
        case role_id = "role_id"
        case email = "email"
        case name = "name"
        case birth_date = "birth_date"
        case gender = "gender"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        role_id = try values.decodeIfPresent(Int.self, forKey: .role_id)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        birth_date = try values.decodeIfPresent(String.self, forKey: .birth_date)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

