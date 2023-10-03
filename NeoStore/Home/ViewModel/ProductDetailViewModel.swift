//
//  ProductDetailViewModel.swift
//  NeoStore
//
//  Created by neosoft on 28/08/23.
//

import Foundation

class ProductDetailViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    
    func getProductDetail(_ productId:Int,_ completion:@escaping(ProductDetails)->Void){
        
        let requestBody = ["product_id":productId]
        
        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.getProductDetailUrl, requestBody: requestBody, resultType:ProductDetailModel.self) { result in
               if result?.status == 200{
                   completion(result!.data)
                }
            }
        } catch let error {
            debugPrint(error)
        }

    }
   
}
