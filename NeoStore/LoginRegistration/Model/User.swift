//
//  Register.swift
//  NeoStore
//
//  Created by apple on 10/08/23.
//

import Foundation

struct User:Codable{
    var firstName:String?
    var lastName:String?
    var email:String?
    var password:String?
    var confirmPassword:String?
    var gender:String?
    var phoneNo:Int?
    
    enum CodingKeys: String,CodingKey{
        case email
        case gender
        case password
        case firstName = "first_name"
        case lastName = "last_name"
        case confirmPassword = "confirm_password"
        case phoneNo = "phone_no"
    }
    var asDictionary: [String: Any] {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase  // To match CodingKeys
            guard let jsonData = try? encoder.encode(self) else {
                return [:]

            }
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
                return [:]

            }
            
            if let dict = jsonObject as? [String: Any] {
                return dict
            } else {
                return [:]

            }
        }
    
}


struct User1:Codable{
    var firstName:String?
    
    enum CodingKeys: String,CodingKey{
        case firstName = "first_name"
    }
    
}

