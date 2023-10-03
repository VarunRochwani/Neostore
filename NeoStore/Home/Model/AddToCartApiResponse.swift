//
//  AddToCartApiResponse.swift
//  NeoStore
//
//  Created by neosoft on 05/09/23.
//

import Foundation

struct AddToCartApiResponse: Codable {
    let status: Int
    let data: Bool?
    let totalCarts: Int?
    let message, userMsg: String

    enum CodingKeys: String, CodingKey {
        case status, data
        case totalCarts = "total_carts"
        case message
        case userMsg = "user_msg"
    }
}
