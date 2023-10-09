//
//  AddressViewModel.swift
//  NeoStore
//
//  Created by neosoft on 08/10/23.
//

import Foundation

class AddressViewModel{
    
    var address = [Address]()
    
    func saveAddress(address:AddressModel){
        
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let newAddress = Address(context: managedContext)
        
        newAddress.setValue(address.address, forKey: #keyPath(Address.address))
        newAddress.setValue(address.landmark, forKey: #keyPath(Address.landmark))
        newAddress.setValue(address.city, forKey: #keyPath(Address.city))
        newAddress.setValue(address.state, forKey: #keyPath(Address.state))
        newAddress.setValue(address.country, forKey:#keyPath(Address.country))
        newAddress.setValue(Double(address.zipcode), forKey:#keyPath(Address.zipcode))
        
        self.address.insert(newAddress, at: 0)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        
    }
    
}
