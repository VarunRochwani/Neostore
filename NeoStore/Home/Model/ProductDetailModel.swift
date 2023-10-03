//
//  File.swift
//  NeoStore
//
//  Created by neosoft on 28/08/23.


import Foundation


struct ProductDetailModel: Codable {
    let status: Int
    let data: ProductDetails
}

struct ProductDetails: Codable {
    let id, productCategoryID: Int
    let name, producer, description: String
    let cost, rating, viewCount: Int
    let created, modified: String
    let productImages: [ProductImage]

    enum CodingKeys: String, CodingKey {
        case id
        case productCategoryID = "product_category_id"
        case name, producer, description, cost, rating
        case viewCount = "view_count"
        case created, modified
        case productImages = "product_images"
    }
}

struct ProductImage: Codable {
    let id, productID: Int
    let image: String
    let created, modified: String

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case image, created, modified
    }
}

