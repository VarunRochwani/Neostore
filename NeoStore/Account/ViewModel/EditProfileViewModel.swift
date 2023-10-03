//
//  EditProfileViewModel.swift
//  NeoStore
//
//  Created by neosoft on 20/09/23.
//

import Foundation
import Alamofire

class EditProfileViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    func editProfile(_ editedData:EditProfileDataModel,_ completion:@escaping(_ result:SuccessResponse)->()){
        
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]
        
        do{
            try httpUtility.postApiData(requestUrl: UrlConstants.updateAccountDetails, requestBody: editedData.toDictionary(), resultType: SuccessResponse.self, completionHandler: { result in
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
