//
//  HomeViewmodel.swift
//  NeoStore
//
//  Created by neosoft on 25/08/23.
//

import Foundation

class HomeViewModel{
    static func silderContent() -> [CollectionViewContent]{
        var homeSliderContent = HomeSliderModel().getHomeSliderContent()
        return homeSliderContent
    }
    
   static  func productContent() -> [CollectionViewContent]{
        return ProductCollectionModel().getProductContentList()
    }
    
}
