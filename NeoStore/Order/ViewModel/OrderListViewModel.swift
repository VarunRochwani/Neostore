//
//  OrderListViewModel.swift
//  NeoStore
//
//  Created by neosoft on 11/09/23.
//

import Foundation
import Alamofire

class OrderListViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    var orderList:[Order] = []
    
    func fetchOrderList(_ completion:@escaping(_ detailResponse:OrderListModel)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]
        
        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.orderListUrl, requestBody: [:], resultType:OrderListModel.self ,completionHandler: { result in
               
                    self.orderList = result?.data ?? []
                    completion(result!)
                
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
    func getOrderListCount() -> Int{
        return orderList.count
    }
    
    func getOrderList() -> [Order]{
        return orderList
    }
}
