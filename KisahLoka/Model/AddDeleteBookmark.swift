//
//  AddDeleteBookmark.swift
//  KisahLoka
//
//  Created by Ni Made Elza Ayu Wismayani Asak on 29/05/24.
//

import Foundation

struct ResponseAddBookmark : Codable {
    let data : DataAddBookmark?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataAddBookmark.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct DataAddBookmark : Codable {
    let created_at : String?
    let getIdLast : Int?

    enum CodingKeys: String, CodingKey {

        case created_at = "created_at"
        case getIdLast = "getIdLast"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        getIdLast = try values.decodeIfPresent(Int.self, forKey: .getIdLast)
    }

}

struct BookmarkRequest: Codable {
    let user_id: Int?
    let uid: String?
    let story_id: Int?
}

struct ResponseDeleteBookmark : Codable {
    let data : DataDeleteBookmark?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataDeleteBookmark.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct DataDeleteBookmark : Codable {
    let deleted_bookmark_id : Int?
    let rowsAffected : Int?

    enum CodingKeys: String, CodingKey {

        case deleted_bookmark_id = "deleted_bookmark_id"
        case rowsAffected = "rowsAffected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        deleted_bookmark_id = try values.decodeIfPresent(Int.self, forKey: .deleted_bookmark_id)
        rowsAffected = try values.decodeIfPresent(Int.self, forKey: .rowsAffected)
    }

}
