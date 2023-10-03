//
//  LoginSuccessResponse.swift
//  NeoStore
//
//  Created by apple on 10/08/23.
//

import Foundation

struct SuccessResponse:Codable{
    var status : Int?
    var data:UserData?
    var message : String?
    var user_msg: String?

}


