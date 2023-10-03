//
//  OrderResponse.swift
//  NeoStore
//
//  Created by neosoft on 13/09/23.
//

import Foundation

struct OrderResonseModel: Codable {
    let status: Int
    let message, userMsg: String

    enum CodingKeys: String, CodingKey {
        case status, message
        case userMsg = "user_msg"
    }
}
