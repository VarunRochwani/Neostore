//
//  StoreViewModel.swift
//  NeoStore
//
//  Created by neosoft on 08/10/23.
//

import Foundation

class StoreLocationViewModel{
    
   static var storeLocationList = Storelocation().getStroreLocationList()
    
    static func getStoreList() -> [StoreLocationModel]{
        return storeLocationList
    }
    
    static func getStoreListCount() -> Int{
        return storeLocationList.count
    }
}
