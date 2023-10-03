//
//  ProductListModel.swift
//  NeoStore
//
//  Created by Shraddha Ghadage on 27/08/2023.
//

import Foundation



import Foundation
import UIKit


struct ProductListModel:Codable {
    let status : Int?
    let data : [ProductData]?
    let message : String?
    let user_msg: String?
}

struct ProductData:Codable{
    let id : Int?
    let productCategoryId : Int?
    let name : String?
    let producer : String?
    let description : String?
    let cost : Int?
    let rating : Int?
    let view_count : Int?
    let created : String?
    let modified : String?
    let productImages : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case productCategoryId = "product_category_id"
        case name = "name"
        case producer = "producer"
        case description = "description"
        case cost = "cost"
        case rating = "rating"
        case view_count = "view_count"
        case created = "created"
        case modified = "modified"
        case productImages = "product_images"
    }
}
 
