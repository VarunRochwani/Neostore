//
//  LoginErrorResponse.swift
//  NeoStore
//
//  Created by apple on 10/08/23.
//

import Foundation
 
struct Response:Codable{
    var status:Int?
    var message:String?
    var userMsg:String?
    
    enum codingKeys:String,CodingKey{
        case userMsg = "user_msg"
    }
    
}
