//
//  Response.swift
//  KisahLoka
//
//  Created by MacBook Air on 11/05/24.
//

import Foundation

struct Response : Codable {
    let data : Data?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}
