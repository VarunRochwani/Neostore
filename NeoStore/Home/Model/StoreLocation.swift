//
//  StoreLocation.swift
//  NeoStore
//
//  Created by neosoft on 14/09/23.
//

import Foundation

struct StoreLocationModel{
    
    var latitude:Double
    var longitude:Double
    var storeAddress:String
    var storeName:String
        
}

struct Storelocation{
    var StoreLocationList : [StoreLocationModel] = []
    
    init(){
        setLocationList()
    }
    
    mutating func setLocationList(){
        let store1 = StoreLocationModel(latitude: 19.151500, longitude: 72.990200, storeAddress: "Ghansoli, Navi Mumbai", storeName: "Jio mart")
        StoreLocationList.append(store1)
        
        let store2 = StoreLocationModel(latitude: 47.033520, longitude: 15.424090, storeAddress: "Turbhe Navi Mumbai, Maharashtra 400705", storeName: "Ikea Store")
        StoreLocationList.append(store2)
        
        let store3 = StoreLocationModel(latitude: 19.199560, longitude: 72.964256, storeAddress: "Thane, Maharashtra 400606", storeName: "viviana mall")
        StoreLocationList.append(store3)
        
        let store4 = StoreLocationModel(latitude: 41.540160, longitude: 2.048210 , storeAddress: "Vashi, Navi Mumbai, Maharashtra 400703", storeName: "satara plaza" )
        StoreLocationList.append(store4)
    }
    
    func getStroreLocationList() -> [StoreLocationModel]{
        return StoreLocationList
    }
}
