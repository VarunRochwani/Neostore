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
    
    
    func fetchNavigationDrawerData(_ completion:@escaping(_ detailResponse:NavigationDrawerModel)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]

        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.fetchAccountDetailsUrl, requestBody: [:], resultType:NavigationDrawerModel.self, completionHandler: { result in
                self.naviagtionDrawerdetails = result
                    completion(result!)
                
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
    static func getOptionList() -> [Option]{
        return DrawerOptions().optionsList
    }
    
}
