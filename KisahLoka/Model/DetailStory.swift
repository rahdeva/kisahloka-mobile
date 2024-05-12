//
//  DetailStory.swift
//  KisahLoka
//
//  Created by MacBook Air on 12/05/24.
//

import Foundation

struct ResponseDataDetailStory : Codable {
    let data : DataDetailStory?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataDetailStory.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct DataDetailStory : Codable {
    let story : DetailStory?

    enum CodingKeys: String, CodingKey {

        case story = "story"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        story = try values.decodeIfPresent(DetailStory.self, forKey: .story)
    }

}

struct DetailStory : Codable {
    let story_id : Int?
    let type_id : Int?
    let type_name : String?
    let origin_id : Int?
    let origin_name : String?
    let title : String?
    let total_content : Int?
    let released_date : String?
    let thumbnail_image : String?
    let read_count : Int?
    let is_highligthed : Int?
    let is_favorited : Int?
    let genre_id : [Int]?
    let genre_name : [String]?
    let synopsis : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case story_id = "story_id"
        case type_id = "type_id"
        case type_name = "type_name"
        case origin_id = "origin_id"
        case origin_name = "origin_name"
        case title = "title"
        case total_content = "total_content"
        case released_date = "released_date"
        case thumbnail_image = "thumbnail_image"
        case read_count = "read_count"
        case is_highligthed = "is_highligthed"
        case is_favorited = "is_favorited"
        case genre_id = "genre_id"
        case genre_name = "genre_name"
        case synopsis = "synopsis"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        story_id = try values.decodeIfPresent(Int.self, forKey: .story_id)
        type_id = try values.decodeIfPresent(Int.self, forKey: .type_id)
        type_name = try values.decodeIfPresent(String.self, forKey: .type_name)
        origin_id = try values.decodeIfPresent(Int.self, forKey: .origin_id)
        origin_name = try values.decodeIfPresent(String.self, forKey: .origin_name)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        total_content = try values.decodeIfPresent(Int.self, forKey: .total_content)
        released_date = try values.decodeIfPresent(String.self, forKey: .released_date)
        thumbnail_image = try values.decodeIfPresent(String.self, forKey: .thumbnail_image)
        read_count = try values.decodeIfPresent(Int.self, forKey: .read_count)
        is_highligthed = try values.decodeIfPresent(Int.self, forKey: .is_highligthed)
        is_favorited = try values.decodeIfPresent(Int.self, forKey: .is_favorited)
        genre_id = try values.decodeIfPresent([Int].self, forKey: .genre_id)
        genre_name = try values.decodeIfPresent([String].self, forKey: .genre_name)
        synopsis = try values.decodeIfPresent(String.self, forKey: .synopsis)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
