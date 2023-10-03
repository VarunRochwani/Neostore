//
//  MyCartViewModel.swift
//  NeoStore
//
//  Created by neosoft on 05/09/23.


import Foundation
import Alamofire

class MyCartViewModel{
    
    let httpUtility = HttpUtility.getUtility()
    
    func fetchCartData(_ completion:@escaping(_ detailResponse:MyCartModel)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]
        
        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.fetchCartDetails, requestBody: [:], resultType:MyCartModel.self ,completionHandler: { result in
                completion(result!)
                
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
    
    func editCartData(_ params:[String:Any] ,_ completion:@escaping(_ detailResponse:AddToCartApiResponse)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]
        
        do {
            try httpUtility.postApiData(requestUrl: UrlConstants.editCartDetails, requestBody: params, resultType: AddToCartApiResponse.self, completionHandler: { result in
                if result?.status == 200{
                    completion(result!)
                }
            },headers:headers)
        }
        catch let error {
            debugPrint(error)
        }
    }
    
    
    func deleteCartData(_ params:[String:Any] ,_ completion:@escaping(_ detailResponse:AddToCartApiResponse)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]
        
        do {
            try httpUtility.postApiData(requestUrl: UrlConstants.deleteCartDetails, requestBody: params, resultType: AddToCartApiResponse.self, completionHandler: { result in
                if result?.status == 200{
                    completion(result!)
                }
            },headers:headers)
        }
        catch let error {
            debugPrint(error)
        }
    }
}
