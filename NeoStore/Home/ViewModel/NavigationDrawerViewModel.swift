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
    
    //var model:UserData?
    
    func fetchNavigationDrawerData(_ completion:@escaping(_ detailResponse:NavigationDrawerModel)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]

        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.fetchAccountDetailsUrl, requestBody: [:], resultType:NavigationDrawerModel.self, completionHandler: { result in
                    completion(result!)
                
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
}
