//
//  Order.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 22.05.22.
//

import Foundation

struct Order {
    var menuItems: [ItemForOrder]
    var date: Date
    
    init(menuItems: [ItemForOrder], date: Date){
        self.menuItems = menuItems
        self.date = date
    }
}
