//
//  OrderToSaveMO+CoreDataProperties.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 23.05.22.
//
//

import Foundation
import CoreData


extension OrderToSaveMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderToSaveMO> {
        return NSFetchRequest<OrderToSaveMO>(entityName: "OrderToSaveMO")
    }

    @NSManaged public var date: Date?
    @NSManaged public var totalPrice: Double

}

extension OrderToSaveMO : Identifiable {

}
