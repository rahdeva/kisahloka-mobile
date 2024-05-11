//
//  Home.swift
//  KisahLoka
//
//  Created by MacBook Air on 11/05/24.
//

import Foundation

struct ResponseDataHome : Codable {
    let data : DataHome?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataHome.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct DataHome : Codable {
    let highlight_stories : [HighlightStoriesHome]?
    let favorite_stories : [FavoriteStoriesHome]?
    let story_types : [StoryTypesHome]?

    enum CodingKeys: String, CodingKey {

        case highlight_stories = "highlight_stories"
        case favorite_stories = "favorite_stories"
        case story_types = "story_types"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        highlight_stories = try values.decodeIfPresent([HighlightStoriesHome].self, forKey: .highlight_stories)
        favorite_stories = try values.decodeIfPresent([FavoriteStoriesHome].self, forKey: .favorite_stories)
        story_types = try values.decodeIfPresent([StoryTypesHome].self, forKey: .story_types)
    }

}

struct HighlightStoriesHome : Codable, Hashable {
    let story_id : Int?
    let type_id : Int?
    let type_name : String?
    let origin_id : Int?
    let origin_name : String?
    let title : String?
    let thumbnail_image : String?
    let is_highligthed : Int?
    let is_favorited : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case story_id = "story_id"
        case type_id = "type_id"
        case type_name = "type_name"
        case origin_id = "origin_id"
        case origin_name = "origin_name"
        case title = "title"
        case thumbnail_image = "thumbnail_image"
        case is_highligthed = "is_highligthed"
        case is_favorited = "is_favorited"
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
        thumbnail_image = try values.decodeIfPresent(String.self, forKey: .thumbnail_image)
        is_highligthed = try values.decodeIfPresent(Int.self, forKey: .is_highligthed)
        is_favorited = try values.decodeIfPresent(Int.self, forKey: .is_favorited)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct FavoriteStoriesHome: Codable, Hashable {
    let story_id : Int?
    let type_id : Int?
    let type_name : String?
    let origin_id : Int?
    let origin_name : String?
    let title : String?
    let thumbnail_image : String?
    let is_highligthed : Int?
    let is_favorited : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case story_id = "story_id"
        case type_id = "type_id"
        case type_name = "type_name"
        case origin_id = "origin_id"
        case origin_name = "origin_name"
        case title = "title"
        case thumbnail_image = "thumbnail_image"
        case is_highligthed = "is_highligthed"
        case is_favorited = "is_favorited"
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
        thumbnail_image = try values.decodeIfPresent(String.self, forKey: .thumbnail_image)
        is_highligthed = try values.decodeIfPresent(Int.self, forKey: .is_highligthed)
        is_favorited = try values.decodeIfPresent(Int.self, forKey: .is_favorited)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct StoryTypesHome : Codable, Hashable {
    let type_id : Int?
    let type_name : String?

    enum CodingKeys: String, CodingKey {

        case type_id = "type_id"
        case type_name = "type_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type_id = try values.decodeIfPresent(Int.self, forKey: .type_id)
        type_name = try values.decodeIfPresent(String.self, forKey: .type_name)
    }

}
