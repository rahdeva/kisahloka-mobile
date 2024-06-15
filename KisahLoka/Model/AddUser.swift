//
//  AddUser.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 15/06/24.
//

import Foundation

struct ResponseAddUser : Codable {
    let data : DataAddUser?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataAddUser.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }
}

struct ResponseEditUser : Codable {
    let data : DataEditUser?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataEditUser.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }
}

struct DataEditUser : Codable {
    let rowsAffected : Int?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case rowsAffected = "rowsAffected"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rowsAffected = try values.decodeIfPresent(Int.self, forKey: .rowsAffected)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct DataAddUser : Codable {
    let created_at : String?
    let userID : Int?

    enum CodingKeys: String, CodingKey {

        case created_at = "created_at"
        case userID = "userID"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
    }

}

struct UserRequest: Codable {
    let uid: String?
    let role_id : Int?
    let email : String?
    let name : String?
    let birth_date : String?
    let gender : String?
}

struct UserRequestEdit: Codable {
    let user_id : Int?
    let uid: String?
    let role_id : Int?
    let email : String?
    let name : String?
    let birth_date : String?
    let gender : String?
}

struct UserRequestAnonymous: Codable {
    let uid: String?
    let role_id : Int?
}
