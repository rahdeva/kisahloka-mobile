//
//  Story.swift
//  KisahLoka
//
//  Created by MacBook Air on 06/05/24.
//

import Foundation

struct Story: Codable, Hashable {
    let id: Int
    let titleStory: String
    let imageStory: String
    let descStory: String
    let storyType: String
    let origin: String
    
    let storyContent: [StoryContent]
    let genre: [String]
}

struct StoryContent: Codable, Hashable{
    let imageStoryContent: String
    let story_Indonesia: String
    let story_English: String
}
