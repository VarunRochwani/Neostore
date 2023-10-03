//
//  ProdctListViewModel.swift
//  NeoStore
//
//  Created by Shraddha Ghadage on 27/08/2023.
//

import Foundation

class ProductListViewModel {
    
    let httpUtility = HttpUtility.getUtility()

    func fetchProductList(_ productCategoryId:Int,completion:@escaping((ProductListModel?)->Void)){
        let requestBody = ["product_category_id":productCategoryId]
        do {
            try httpUtility.getApiData(requestUrl: UrlConstants.getProductListUrl, requestBody:requestBody, resultType:ProductListModel.self , completionHandler: { result in
                if result?.status == 200{
                    completion(result)
                }
                else{
                    AlertUtility.showAlert(result?.message ?? "", result?.user_msg ?? "", ProductListViewController())
                }
            })
        } catch let error {
            print(error)
        }
    }
    
}