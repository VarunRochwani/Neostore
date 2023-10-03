//
//  UserData.swift
//  NeoStore
//
//  Created by apple on 10/08/23.
//

import Foundation

struct UserData: Codable {
    let id: Int?
    let roleId: Int?
    let firstName: String?
    let lastName: String?
    let email: String?
    let userName: String?
    let gender: String?
    let phoneNo: String?
    let isActive: Bool?
    let created: String?
    let modified: String?
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case roleId = "role_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case userName = "username"
        case gender
        case phoneNo = "phone_no"
        case isActive = "is_active"
        case created
        case modified
        case accessToken = "access_token"
    }
   
}
