//
//  ForgotPasswordViewModel.swift
//  NeoStore
//
//  Created by neosoft on 13/09/23.
//

import Foundation

class ForgotPasswordViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    func checkEmptyValidation(_ email:String) -> Bool{
        if email == ""{
            return false
        }
        return true
    }
    
    
    func forgotPassword(_ email:String,_ forgotPasswordResponse:@escaping((Response) -> Void)){
    
        let requestBody = ["email":email]
    
        do {
            try httpUtility.postApiData(requestUrl: UrlConstants.forgotPasswordUrl, requestBody: requestBody, resultType: Response.self, completionHandler: { result in
                
                forgotPasswordResponse(result!)
            
            })
        } catch let error {
            print(error)
        }
    }
    
    
}
