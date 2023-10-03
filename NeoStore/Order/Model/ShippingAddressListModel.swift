//
//  File.swift
//  NeoStore
//
//  Created by neosoft on 11/09/23.
//

import Foundation
import UIKit

struct ShippingAddressListModel{
    var ShippingAddressList:[shippingAddressAndBtn]?
}

struct shippingAddressAndBtn{
    
    var address:String?
    var buttonImage:UIImage?
    var isSelected:Bool?
    
}
