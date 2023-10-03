//
//  ErrorResponseDataAlreadyExist.swift
//  NeoStore
//
//  Created by apple on 10/08/23.
//

import Foundation

struct ErrorResponseDataAlreadyExist<T>{
    
    var status:Int?
    var data:T?
    var message:String?
    var userMsg:String?
    
    enum codingKeys : String, CodingKey{
        case userMsg = "user_msg"
    }
    
}
