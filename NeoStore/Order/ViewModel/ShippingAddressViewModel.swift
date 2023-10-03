//
//  ShippingAddressViewModel.swift
//  NeoStore
//
//  Created by neosoft on 13/09/23.
//

import Foundation
import Alamofire

class ShippingAddressViewModel {
    
    let httpUtility = HttpUtility.getUtility()
    
    func placeTheOrder(_ address:String,_ completion:@escaping(_ detailResponse:OrderResonseModel)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]
        let requestBody = ["address":address]
        
        do {
            try httpUtility.postApiData(requestUrl: UrlConstants.orderUrl, requestBody: requestBody, resultType:OrderResonseModel.self ,completionHandler: { result in
                completion(result!)
                
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
    
}
