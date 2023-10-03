//
//  RegisterViewModel.swift
//  NeoStore
//
//  Created by apple on 11/08/23.
//

import Foundation

class RegisterViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    func validateAndRegister(user:User,_ completion: @escaping((String,Int)->Void)){
        let result = Validations.validateFirstName(user.firstName)
        if !result.0 {
            completion(result.1,400)
        }
        
        let lastNameResult = Validations.validateLastName(user.lastName)
            if !lastNameResult.0{
                completion(lastNameResult.1,400)
        }
        
        let emailResult = Validations.validateEmail(user.email)
            if !emailResult.0{
                completion(emailResult.1,400)
                
        }
        
        let passwordResult = Validations.validatePassword(user.password)
            if !passwordResult.0{
                completion(passwordResult.1,400)
        }
        let confirmPasswordResult = Validations.validateConfirmPassword(user.confirmPassword,password: user.password)
            if !confirmPasswordResult.0{
                completion(confirmPasswordResult.1,400)
        }
        if !Validations.validateGender(user.gender){
            completion(ErrorConstants.selectGenderError,400)
        }
    

        do{

            try httpUtility.postApiData(requestUrl: UrlConstants.registerUrl, requestBody: user.asDictionary, resultType:SuccessResponse.self) { result in
                if result?.status == 200{
                    completion(result?.message ?? "",200)
                }
            }
        }
        catch let error{
            debugPrint(error.localizedDescription)
        }

        }
    }
    
    

