//
//  NavigationDrawerModel.swift
//  NeoStore
//
//  Created by neosoft on 30/08/23.


import Foundation


struct NavigationDrawerModel: Codable {
    let status: Int
    let data: DataClass
    
}

// MARK: - DataClass
struct DataClass: Codable {
    let userData: UserDetails
    let productCategories: [ProductCategory]
    let totalCarts,totalOrders: Int

    enum CodingKeys: String, CodingKey {
        case userData = "user_data"
        case productCategories = "product_categories"
        case totalCarts = "total_carts"
        case totalOrders = "total_orders"
    }
}

// MARK: - ProductCategory
struct ProductCategory: Codable {
    let id: Int
    let name: String
    let iconImage: String
    let created, modified: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case iconImage = "icon_image"
        case created, modified
    }
}

// MARK: - UserDetails
struct UserDetails: Codable {
    let id, roleID: Int
    let firstName, lastName, email, username: String
    let profilePic, countryID: String?
    let gender, phoneNo: String
    let dob: String?
    let isActive: Bool
    let created, modified: String
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case id
        case roleID = "role_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email, username
        case profilePic = "profile_pic"
        case countryID = "country_id"
        case gender
        case phoneNo = "phone_no"
        case dob
        case isActive = "is_active"
        case created, modified
        case accessToken = "access_token"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


