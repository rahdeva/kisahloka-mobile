//
//  DataTypes.swift
//  KisahLoka
//
//  Created by MacBook Air on 11/05/24.
//

import Foundation

struct ResponseDataTypes : Codable {
    let data : DataTypes?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataTypes.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct DataTypes : Codable {
    let meta : Meta?
    let types : [Types]?

    enum CodingKeys: String, CodingKey {

        case meta = "meta"
        case types = "types"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        types = try values.decodeIfPresent([Types].self, forKey: .types)
    }

}

struct Types : Codable, Hashable {
    let type_id : Int?
    let type_name : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case type_id = "type_id"
        case type_name = "type_name"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type_id = try values.decodeIfPresent(Int.self, forKey: .type_id)
        type_name = try values.decodeIfPresent(String.self, forKey: .type_name)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
