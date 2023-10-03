//
//  ResetPasswordModel.swift
//  NeoStore
//
//  Created by neosoft on 10/09/23.
//

import Foundation

struct ResetPasswordModel {
    
    var oldPassword: String
    var password: String
    var confirmPassword: String

    func toDictionary() -> [String: Any] {
        return [
            "old_password": oldPassword,
            "password": password,
            "confirm_password": confirmPassword
        ]
    }
}
