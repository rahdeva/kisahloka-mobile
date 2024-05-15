import Foundation

class Environments {
    static let PRODUCTION = ""
    static let DEV = "http://188.166.210.146:4009/jdi/api/v1"
    static let LOCAL = "http://10.62.52.30:4000/api/v1" // Apple
//    static let LOCAL = "http://192.168.0.158:4000/api/v1" // Wifi Kost
//    static let LOCAL = "http://192.168.0.113:4000/api/v1" // Wifi Kogu
//    static let LOCAL = "http://172.20.10.2:4000/api/v1" // Hotspot

    static var currentEnvironment = Environments.LOCAL

    static func setEnvironment(_ value: String) {
        currentEnvironment = value
    }

    static func getEnvironment() -> String {
        return currentEnvironment
    }
}

class BaseURL {
    static let baseURL = Environments.getEnvironment()

    // User
    static let user = "\(baseURL)/users"
    static func userByID(userId: Int?) -> String {
        return "\(baseURL)/users/\(userId ?? 0)"
    }

    // Type
    static let type = "\(baseURL)/type"
    static func typeByID(typeID: Int?) -> String {
        return "\(baseURL)/type/\(typeID ?? 0)"
    }
    
    // Origin
    static let origin = "\(baseURL)/origin"
    static func originByID(originID: Int?) -> String {
        return "\(baseURL)/origin/\(originID ?? 0)"
    }
    
    // Genre
    static let genre = "\(baseURL)/genre"
    static func genreByID(genreID: Int?) -> String {
        return "\(baseURL)/genre/\(genreID ?? 0)"
    }
    
    // Role
    static let role = "\(baseURL)/role"
    static func roleByID(roleID: Int?) -> String {
        return "\(baseURL)/role/\(roleID ?? 0)"
    }
    
    // Story
    static let story = "\(baseURL)/story"
    static let storyExplore = "\(baseURL)/story_preview"
    static func storyByID(storyID: Int?) -> String {
        return "\(baseURL)/story/\(storyID ?? 0)"
    }
    static func storyContentByID(storyID: Int?) -> String {
        return "\(baseURL)/story/contents/\(storyID ?? 0)"
    }
    static func storyRandomRecommendation(storyID: Int?) -> String {
        return "\(baseURL)/story_recommendation/random/\(storyID ?? 0)"
    }
    
    // Bookmark
    static let bookmark = "\(baseURL)/bookmark"
    static func bookmarkByID(bookmarkID: Int?) -> String {
        return "\(baseURL)/bookmark/\(bookmarkID ?? 0)"
    }
    static func bookmarkByUserID(userID: Int?) -> String {
        return "\(baseURL)/bookmark/user/\(userID ?? 0)"
    }
    
    // Home
    static let home = "\(baseURL)/home"
}
