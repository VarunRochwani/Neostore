//
//  AddToCartViewModel.swift
//  NeoStore
//
//  Created by neosoft on 06/09/23.
//

import Foundation
import UIKit
import Alamofire

protocol AddTocartDelegate{
    func  getAddtoCartResponse(_ apiResponse:AddToCartApiResponse)
}

class AddToCartViewModel{

    var delegate:AddTocartDelegate!
    
    let httpUtility = HttpUtility.getUtility()
    
    func callAddtoCartApi(_ quantity:Int,_ productId:Int){
        
        let requestBody = [Constant.productId:productId,Constant.quantity:quantity]
        let accessToken = UserDefaults.standard.string(forKey: Constant.accessTokenKey)
        
        let header : HTTPHeaders = [Constant.accessTokenKey:accessToken ?? ""]
        do {
            try  httpUtility.postApiData(requestUrl: UrlConstants.addToCartUrl, requestBody: requestBody, resultType:AddToCartApiResponse.self , completionHandler: { result in
                
                    guard let result1 = result else{
                        return
                    }
                
                    self.delegate.getAddtoCartResponse(result1)

            },headers:header)
       
        } catch let error {
            debugPrint(error)
        }
    }
    
}
