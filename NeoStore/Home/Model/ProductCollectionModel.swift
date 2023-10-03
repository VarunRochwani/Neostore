//
//  ProductCollectionModel.swift
//  NeoStore
//
//  Created by neosoft on 25/08/23.
//

import Foundation
import UIKit

struct ProductCollectionModel {
    
    var productContentList : [CollectionViewContent] = []
    
    init(){
        setProductContent()
    }
    
    mutating func setProductContent(){
        let productTable = CollectionViewContent(contentImage: UIImage(named: Images.table)!,contentId: 1)
        productContentList.append(productTable)
        
        let productChair = CollectionViewContent(contentImage: UIImage(named: Images.chair)!,contentId: 2)
        productContentList.append(productChair)
        
        let productSofa = CollectionViewContent(contentImage: UIImage(named: Images.sofa)!,contentId: 3)
        productContentList.append(productSofa)
        
        let productCupBoard = CollectionViewContent(contentImage: UIImage(named: Images.cupboard)!,contentId: 4)
        productContentList.append(productCupBoard)
    }
    
    func getProductContentList() -> [CollectionViewContent]{
        return productContentList
    }
    
    func getProductId(_ indexId : Int) -> Int{
        return productContentList[indexId].contentId ?? 0
    }
}
