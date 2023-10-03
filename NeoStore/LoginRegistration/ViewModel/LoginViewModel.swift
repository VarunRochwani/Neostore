//
//  LoginViewModel.swift
//  NeoStore
//
//  Created by neosoft on 24/08/23.
//

import Foundation

class LoginViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    func login(_ credentials:Credentials,_ successLogin:@escaping((SuccessResponse) -> Void)){
    
        let requestBody = ["email":credentials.email,"password":credentials.password]
        
        //let requestBody = ["email":"mfm@gmail.com","password":"mf@123"]
        do {
            try httpUtility.postApiData(requestUrl: UrlConstants.loginUrl, requestBody: requestBody, resultType: SuccessResponse.self, completionHandler: { result in
              
               successLogin(result!)
            
            })
        } catch let error {
            print(error)
        }
    }
    
}