//
//  MyCartModel.swift
//  NeoStore
//
//  Created by neosoft on 05/09/23.
//

import Foundation

struct MyCartModel: Codable {
    let status: Int
    let data: [ProdData]?
    let count, total: Int?
    let message:String?
    let userMsg:String?
    
    enum CodingKeys: String, CodingKey {
            case status = "status"
            case data = "data"
            case count = "count"
            case total = "total"
            case message = "message"
            case userMsg = "user_msg"
        }
}


// MARK: - ProdData
struct ProdData: Codable {
    let id, productID, quantity: Int
    let product: Product

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case quantity, product
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let name: String
    let cost: Int
    let productCategory: String
    let productImages: String
    let subTotal: Int

    enum CodingKeys: String, CodingKey {
        case id, name, cost
        case productCategory = "product_category"
        case productImages = "product_images"
        case subTotal = "sub_total"
    }
}
