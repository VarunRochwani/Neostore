//
//  Address+CoreDataProperties.swift
//  NeoStore
//
//  Created by neosoft on 08/09/23.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var address: String?
    @NSManaged public var landmark: String?
    @NSManaged public var city: String?
    @NSManaged public var zipcode: Double
    @NSManaged public var country: String?
    @NSManaged public var state: String?

}

extension Address : Identifiable {

}
