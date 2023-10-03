//
//  orderDetailModel.swift
//  NeoStore
//
//  Created by neosoft on 12/09/23.
//

import Foundation

struct OrderDetailModel: Codable {
    let status: Int
    let data: OrderData?
}

// MARK: - OrderData
struct OrderData: Codable {
    let id, cost: Int
    let address: String
    let orderDetails: [OrderDetail]?

    enum CodingKeys: String, CodingKey {
        case id, cost, address
        case orderDetails = "order_details"
    }
}

// MARK: - OrderDetail
struct OrderDetail: Codable {
    let id, orderID, productID, quantity: Int
    let total: Int
    let prodName, prodCatName: String
    let prodImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case orderID = "order_id"
        case productID = "product_id"
        case quantity,total
        case prodName = "prod_name"
        case prodCatName = "prod_cat_name"
        case prodImage = "prod_image"
    }
}
