//
//  RatingViewModel.swift
//  NeoStore
//
//  Created by neosoft on 15/09/23.
//

import Foundation


protocol getRatingApiDelegate{
    func getRatingApiResponse(_ ratingResponse: RatingResponseModel)
}
class RatingViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    var delegate:getRatingApiDelegate!
    
    func setRating(_ rating:Int ,_ productId:Int){
    
        let requestBody = [Constant.productId:productId,Constant.rating:rating]
        
        do {
            try  httpUtility.postApiData(requestUrl: UrlConstants.setRatingUrl, requestBody: requestBody, resultType:RatingResponseModel.self , completionHandler: { result in

                if result?.status == 200{

                    guard let result1 = result else{
                        return
                    }
                
                    self.delegate.getRatingApiResponse(result1)
                }
                else{

                }
            },headers:nil)
       
        } catch let error {
            debugPrint(error)
        }
        
    }
    
}
