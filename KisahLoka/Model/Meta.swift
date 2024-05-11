//
//  Meta.swift
//  KisahLoka
//
//  Created by MacBook Air on 11/05/24.
//

import Foundation

struct Meta : Codable {
    let limit : Int?
    let page : Int?
    let total_page : Int?
    let total_items : Int?

    enum CodingKeys: String, CodingKey {

        case limit = "limit"
        case page = "page"
        case total_page = "total_page"
        case total_items = "total_items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total_page = try values.decodeIfPresent(Int.self, forKey: .total_page)
        total_items = try values.decodeIfPresent(Int.self, forKey: .total_items)
    }

}
