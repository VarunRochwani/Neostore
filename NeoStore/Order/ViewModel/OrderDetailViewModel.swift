//
//  OrderDetailViewModel.swift
//  NeoStore
//
//  Created by neosoft on 12/09/23.
//

import Foundation
import Alamofire

class OrderDetailViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    func fetchOrderDetails(_ orderId:Int,_ completion:@escaping(_ detailResponse:OrderDetailModel)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]
        let requestBody = ["order_id":orderId]
        
        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.orderDetailUrl, requestBody: requestBody, resultType:OrderDetailModel.self ,completionHandler: { result in
                completion(result!)
                
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
}
