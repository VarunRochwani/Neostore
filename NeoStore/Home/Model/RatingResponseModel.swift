//
//  RatingResponseModel.swift
//  NeoStore
//
//  Created by neosoft on 15/09/23.
//

import Foundation

struct RatingResponseModel: Codable {
    let status: Int
    let data: ResponseData
    let message, userMsg: String

    enum CodingKeys: String, CodingKey {
        case status, data, message
        case userMsg = "user_msg"
    }
}


struct ResponseData: Codable {
    let id, productCategoryID: Int
    let name, producer, description: String
    let cost: Int
    let rating: Double
    let viewCount: Int
    let created, modified: String

    enum CodingKeys: String, CodingKey {
        case id
        case productCategoryID = "product_category_id"
        case name, producer, description, cost, rating
        case viewCount = "view_count"
        case created, modified
    }
}
