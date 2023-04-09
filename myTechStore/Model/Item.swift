//
//  Item.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 22.05.22.
//

import Foundation


struct Item: Codable {
    var id: Int
    var name: String
    var details: String
    var price: Double
    var category: String
    var imageURL: URL

enum CodingKeys: String, CodingKey {
    case id
    case name
    case details = "description"
    case price
    case category
    case imageURL = "image_url"
    }
}

struct MenuItems: Codable {
    var menuItems: [Item]
}


public class ItemForOrder {
     
    var selectedItem: Item
    var total: Double
 
     init(selectedItem: Item, total: Double) {
        self.selectedItem = selectedItem
        self.total = total
    }
}
