//
//  OrderListModel.swift
//  NeoStore
//
//  Created by neosoft on 11/09/23.
//

import Foundation

struct OrderListModel: Codable {
    let status: Int
    let data: [Order]
    let message: String
    let user_msg: String
}

struct Order: Codable {
    let id: Int
    let cost: Int
    let created: String
}
