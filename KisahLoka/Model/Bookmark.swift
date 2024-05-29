//
//  Bookmark.swift
//  KisahLoka
//
//  Created by MacBook Air on 15/05/24.
//

import Foundation

struct ResponseDataBookmark : Codable {
    let data : DataBookmark?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataBookmark.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct DataBookmark : Codable {
    let bookmarks : [Bookmark]?
    let meta : Meta?

    enum CodingKeys: String, CodingKey {

        case bookmarks = "bookmarks"
        case meta = "meta"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bookmarks = try values.decodeIfPresent([Bookmark].self, forKey: .bookmarks)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    }

}


struct Bookmark : Codable, Hashable {
    let bookmark_id : Int?
    let user_id : Int?
    let uid : String?
    let story_id : Int?
    let created_at : String?
    let updated_at : String?
    let title : String?
    let origin_name : String?
    let thumbnail_image : String?
    let total_content : Int?

    enum CodingKeys: String, CodingKey {

        case bookmark_id = "bookmark_id"
        case user_id = "user_id"
        case uid = "uid"
        case story_id = "story_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case title = "title"
        case origin_name = "origin_name"
        case thumbnail_image = "thumbnail_image"
        case total_content = "total_content"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bookmark_id = try values.decodeIfPresent(Int.self, forKey: .bookmark_id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        story_id = try values.decodeIfPresent(Int.self, forKey: .story_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        origin_name = try values.decodeIfPresent(String.self, forKey: .origin_name)
        thumbnail_image = try values.decodeIfPresent(String.self, forKey: .thumbnail_image)
        total_content = try values.decodeIfPresent(Int.self, forKey: .total_content)
    }

}
