//
//  StoryContent.swift
//  KisahLoka
//
//  Created by MacBook Air on 13/05/24.
//

import Foundation

struct ResponseDataStoryContent : Codable {
    let data : DataStoryContent?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(DataStoryContent.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct DataStoryContent : Codable {
    let story : StoryDetailReading?

    enum CodingKeys: String, CodingKey {

        case story = "story"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        story = try values.decodeIfPresent(StoryDetailReading.self, forKey: .story)
    }

}


struct StoryDetailReading : Codable {
    let story_content : [StoryContentReading]?
    let story_id : Int?
    let title : String?

    enum CodingKeys: String, CodingKey {

        case story_content = "story_content"
        case story_id = "story_id"
        case title = "title"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        story_content = try values.decodeIfPresent([StoryContentReading].self, forKey: .story_content)
        story_id = try values.decodeIfPresent(Int.self, forKey: .story_id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }

}

struct StoryContentReading : Codable {
    let order : Int?
    let image : String?
    let content_indo : String?
    let content_eng : String?

    enum CodingKeys: String, CodingKey {

        case order = "order"
        case image = "image"
        case content_indo = "content_indo"
        case content_eng = "content_eng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        content_indo = try values.decodeIfPresent(String.self, forKey: .content_indo)
        content_eng = try values.decodeIfPresent(String.self, forKey: .content_eng)
    }

}
