//
//  ErrorConstants.swift
//  NeoStore
//
//  Created by apple on 11/08/23.
//

import Foundation

struct ErrorConstants{
    
    static let noError:String = ""
    static let emptyFirstName:String = "Please enter first name"
    static let emptyLastName:String = "Please enter last name"
    static let errorNameCountLessThanThree:String = "First Name should be greater than 3"
    static let errorLastNameCountLessThanThree:String = "last Name should be greater than 3"
    static let errorOnlyCharactersAllowed:String = "only characters are allowed"
    static let errorInvalidEmail:String = "Please enter valid Email"
    static let errorInvalidPassword = "Password should contain minimum 1 number , 1 special character"
    static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static let passwordRegex = "^(?=.*[0-9])(?=.*[!@#$%^&*(),.?\":{}|<>])[a-zA-Z0-9!@#$%^&*(),.?\":{}|<>]{1,}$"
    static let passwordErrorMessage  = "please enter password"
    static let format = "SELF MATCHES %@"
    static let errorConfirmPassword = "Password not matching, please recheck"
    static let mobileNumberRegex = "^[0-9]{10}$"
    static let phoneErrorMessage  = "Please Check the phone number"
    static let characterRegex = "^[a-zA-Z]+$"
    static let selectGenderError  = "Please select the gender"
}
