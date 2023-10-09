//
//  ResetPasswordViewModel.swift
//  NeoStore
//
//  Created by neosoft on 10/09/23.
//

import Foundation
import Alamofire

class ResetPasswordViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    func resetPassword(_ resetpasswordModel:ResetPasswordModel,_ completion:@escaping(_ result:Response)->()){
        
        let accessToken = UserDefaults.standard.string(forKey: Constant.accessTokenKey)
        
        let headers : HTTPHeaders = [Constant.accessTokenKey:accessToken ?? ""]
        
        do{
            try httpUtility.postApiData(requestUrl: UrlConstants.resetPasswordUrl, requestBody: resetpasswordModel.toDictionary(), resultType: Response.self, completionHandler: { result in
                guard let responseResult = result else{
                    return
                }
                completion(responseResult)
            },headers: headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
}
