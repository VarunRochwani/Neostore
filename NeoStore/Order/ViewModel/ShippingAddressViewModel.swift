//
//  ShippingAddressViewModel.swift
//  NeoStore
//
//  Created by neosoft on 13/09/23.
//

import Foundation
import Alamofire
import CoreData

class ShippingAddressViewModel {
    
    let httpUtility = HttpUtility.getUtility()
    var addressList :[Address]?
    var ShippingAddressList:[shippingAddressAndBtn] = []
    
    func placeTheOrder(_ address:String,_ completion:@escaping(_ detailResponse:OrderResonseModel)->Void){
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        let headers : HTTPHeaders = ["access_token":accessToken ?? ""]
        let requestBody = ["address":address]
        
        do {
            try httpUtility.postApiData(requestUrl: UrlConstants.orderUrl, requestBody: requestBody, resultType:OrderResonseModel.self ,completionHandler: { result in
                completion(result!)
                
            },headers:headers)
        } catch let error {
            debugPrint(error)
        }
    }
    
    func fetchAddressListData() -> [Address]? {
        let addressFetch: NSFetchRequest<Address> = Address.fetchRequest()
        
        do {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try managedContext.fetch(addressFetch)
            addressList = results
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        return addressList
    }
    
    func setShippingAddressList() -> [shippingAddressAndBtn]{

        guard let list = addressList else{
            return []
        }
        for i in 0..<list.count  {
            ShippingAddressList.append(shippingAddressAndBtn(address: addressList?[i].address,buttonImage: UIImage(named:Images.addressUnchecked),isSelected: false))
        }
        return ShippingAddressList
    }

    func getShippingAddressListCount() -> Int {
        return ShippingAddressList.count
    }
    func getShippingAddressList() -> [shippingAddressAndBtn] {
        return ShippingAddressList
    }
    
    
}
