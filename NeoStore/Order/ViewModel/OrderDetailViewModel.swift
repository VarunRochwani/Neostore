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
    var orderDetails :[OrderDetail]?
    
    func fetchOrderDetails(_ orderId:Int,_ completion:@escaping(_ detailResponse:OrderDetailModel)->Void){
        let accessToken = UserDefaults.standard.string(forKey: Constant.accessTokenKey)
        let headers : HTTPHeaders = [Constant.accessTokenKey:accessToken ?? ""]
        let requestBody = [Constant.orderId:orderId]
        
        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.orderDetailUrl, requestBody: requestBody, resultType:OrderDetailModel.self ,completionHandler: { result in
                self.orderDetails = result?.data?.orderDetails
                completion(result!)
                
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
    func getOrderDetails() -> [OrderDetail]?{
        return orderDetails
    }
    
    func getOrderDetailCount() -> Int {
        return orderDetails?.count ?? 0
    }
}
