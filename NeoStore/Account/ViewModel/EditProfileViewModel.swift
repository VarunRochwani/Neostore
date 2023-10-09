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
    var editProfileData: EditProfileDataModel?
    
    func editProfile(_ editedData:EditProfileDataModel,_ completion:@escaping(_ result:SuccessResponse)->()){
        
        let accessToken = UserDefaults.standard.string(forKey: Constant.accessTokenKey)
        
        let headers : HTTPHeaders = [Constant.accessTokenKey:accessToken ?? ""]
        
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
    
    func getEditData() ->EditProfileDataModel?{
        return editProfileData
    }
    func setEditData(editData:EditProfileDataModel) {
        editProfileData = editData
    }
    
}
