//
//  NavigationDrawerViewModel.swift
//  NeoStore
//
//  Created by neosoft on 31/08/23.
//

import Foundation
import Alamofire

class NavigationDrawerViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    var naviagtionDrawerdetails:NavigationDrawerModel?
    var editProfileData:EditProfileDataModel?
    
    func fetchNavigationDrawerData(completion:@escaping(()->Void)){
        let accessToken = UserDefaults.standard.string(forKey: Constant.accessTokenKey)
        
        let headers : HTTPHeaders = [Constant.accessTokenKey:accessToken ?? ""]

        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.fetchAccountDetailsUrl, requestBody: [:], resultType:NavigationDrawerModel.self, completionHandler: { result in
                if result?.status == 200{
                    self.naviagtionDrawerdetails = result
                    self.editProfileData = EditProfileDataModel(firstName: result?.data.userData.firstName ?? "",
                        lastName: result?.data.userData.lastName ?? "",
                        email: result?.data.userData.email ?? "",
                        dob: result?.data.userData.dob ?? "",
                        profilePic: result?.data.userData.profilePic ?? "",
                        phoneNo: result?.data.userData.phoneNo ?? "")
                    completion()
                }
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
    static func getOptionList() -> [Option]{
        return DrawerOptions().optionsList
    }
    
    
    func getProfilePic() -> String{
        return naviagtionDrawerdetails?.data.userData.profilePic ?? ""
    }
    
    func getfirstName() -> String{
        return naviagtionDrawerdetails?.data.userData.firstName ?? ""
    }
    
    func getDob() -> String{
        return naviagtionDrawerdetails?.data.userData.dob ?? ""
    }
    func getLastName() -> String{
        return naviagtionDrawerdetails?.data.userData.lastName ?? ""
    }
    func getEmail() -> String{
        return naviagtionDrawerdetails?.data.userData.email ?? ""
    }
    func getPhoneNo() -> String{
        return naviagtionDrawerdetails?.data.userData.phoneNo ?? ""
    }
    func getUserName() -> String{
        return naviagtionDrawerdetails?.data.userData.username ?? ""
    }
    
    func getEditProfileData() -> EditProfileDataModel{
        return editProfileData ?? EditProfileDataModel(firstName: "", lastName: "", email: "", dob: "", profilePic: "", phoneNo: "")
    }

}
