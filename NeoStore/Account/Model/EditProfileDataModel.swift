//
//  EditProfileDataModel.swift
//  NeoStore
//
//  Created by neosoft on 20/09/23.
//

import Foundation

struct EditProfileDataModel{
    
    var firstName:String
    var lastName:String
    var email:String
    var dob:String
    var profilePic:String
    var phoneNo:String
    
    
    func toDictionary() -> [String: Any] {
        return [
            "first_name":  firstName,
            "last_name": lastName,
            "email":email,
            "dob":dob,
            "profile_pic": profilePic,
            "phone_no":phoneNo
        ]
    }
    
}
