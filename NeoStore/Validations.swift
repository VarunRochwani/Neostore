//
//  Validations.swift
//  NeoStore
//
//  Created by apple on 11/08/23.
//

import Foundation

class Validations{
    static func validateFirstName(_ firstName:String?) ->(Bool,String){
        
        
        if firstName?.isEmpty ?? false {
            return (false,  ErrorConstants.emptyFirstName)
        } else if firstName!.count < 3 {

            return (false, ErrorConstants.errorNameCountLessThanThree)
        }
//        else if !Validations.checkForCharacters(firstName ?? " "){
//
//            return (false,ErrorConstants.errorOnlyCharactersAllowed)
//        }
        return (true, ErrorConstants.noError)
    }
    
    static func validateLastName(_ lastName:String?) -> (Bool,String){
        if lastName?.isEmpty ?? false {
            return (false,  ErrorConstants.emptyLastName)
        } else if lastName!.count < 3 {

            return (false, ErrorConstants.errorLastNameCountLessThanThree)
        }
//        else if !Validations.checkForCharacters(lastName ?? ""){
//            return (false,ErrorConstants.errorOnlyCharactersAllowed)
//        }
        return (true, ErrorConstants.noError)
    }
    
    static func validateEmail(_ email:String?) ->(Bool,String){
        
        let emailPredicate = NSPredicate(format:ErrorConstants.format, ErrorConstants.emailRegex)
        if emailPredicate.evaluate(with: email){
            return (true,ErrorConstants.noError)
        }
        return (false,ErrorConstants.errorInvalidEmail)
    }
    
    static func validatePassword(_ password:String?) -> (Bool,String){
        if password?.isEmpty ?? false{
            return (false,ErrorConstants.passwordErrorMessage)
        }
        let passwordPredicate = NSPredicate(format: ErrorConstants.format, ErrorConstants.passwordRegex)
        if passwordPredicate.evaluate(with: password){
            return (true,ErrorConstants.noError)
        }
        return (false, ErrorConstants.errorInvalidPassword)
    }
    
    static func validateConfirmPassword(_ confirmPassword:String?,password: String?) ->(Bool,String) {
        if confirmPassword == password{
            return (true,ErrorConstants.noError)
        }
        return (false,ErrorConstants.errorConfirmPassword)
    }
    
    static func validateGender(_ gender:String?) -> Bool{
        if gender != nil{
            return true
        }
        return false
    }
    
//    static func validatePhoneNo(_ phone:Int?) -> (Bool,String){
//
//        let mobileNumberPredicate = NSPredicate(format: ErrorConstants.format, ErrorConstants.mobileNumberRegex)
//        let phoneString = phone as? String
//        if mobileNumberPredicate.evaluate(with: phoneString){
//            return (true,ErrorConstants.noError)
//        }
//        return (false,ErrorConstants.phoneErrorMessage)
//    }
    
//    static func checkForCharacters(_ text:String) -> Bool{
//
//        let characterValidation = NSPredicate(format:ErrorConstants.format, ErrorConstants.characterRegex)
//        let isCharacterValid = characterValidation.evaluate(with: text)
//        return isCharacterValid
//    }
    
}
