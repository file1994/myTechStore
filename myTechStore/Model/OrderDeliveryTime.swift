//
//  OrderDeliveryTime.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 22.05.22.
//

import Foundation

struct DeliveryTime: Codable {
    let deliveryTime: Int
    
    enum CodingKeys: String, CodingKey {
        case deliveryTime = "preparation_time"
    }
}
