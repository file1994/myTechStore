//
//  ProductData.swift
//  myTechStore
//
//  Created by Filip Stojanovic on 22.05.22.
//

import Foundation

struct ProductData {
    static let categories = [Categories(categoryName: "mice", categoryImageURL: URL(fileURLWithPath: "mice")), Categories(categoryName: "gamepads", categoryImageURL: URL(fileURLWithPath: "gamepads"))]
     
    static let productItems = [
        Item(
            id: 1,
            name: "Razer Naga",
            details: "Connection: USB / USB nano receiver / Bluetooth\nSensor: Optical\nResolution: 20000 DPI\nBattery type: Rechargeable battery",
            price: 200.0,
            category: "mice",
            imageURL: URL(fileURLWithPath: "razerNaga")
        ),
        Item(
            id: 2,
            name: "Razer Deathadder",
            details: "Connection: USB\nSensor: Optical\nResolution: 6400 DPI\nSwitch type: Razer Mechanical",
            price: 55.0,
            category: "mice",
            imageURL: URL(fileURLWithPath: "razerDeathadder")        ),
        Item(
            id: 3,
            name: "Logitech G-Pro 910",
            details: "Connection: USB\nSensor: Optical\nResolution: 16000 DPI\nPolling rate response: 1000 Hz / 1 ms",
            price: 100.0,
            category: "mice",
            imageURL: URL(fileURLWithPath: "logitechGpro")
        ),
        Item(
            id: 4,
            name: "Logitech G402 Hyperion",
            details: "Connection: USB\nSensor: Optical\nResolution: 4000 DPI\nPolling rate response: 1000 Hz / 1 ms",
            price: 55.0,
            category: "mice",
            imageURL: URL(fileURLWithPath: "logitechG402")
        ),
        Item(
            id: 5,
            name: "Logitech F310",
            details: "Connection: USB\nCompatibility: Windows",
            price: 50,
            category: "gamepads",
            imageURL: URL(fileURLWithPath: "logitechF310")
        ),
        Item(
            id: 6,
            name: "Razer Raiju",
            details: "Connection: USB, Bluetooth\nCompatibility: Windows, Playstation",
            price: 200.0,
            category: "gamepads",
            imageURL: URL(fileURLWithPath: "razerRaiju")
        ),
        Item(
            id: 7,
            name: "Nacon PS4",
            details: "Connection: USB, Bluetooth\nCompatibility: Windows, Playstation",
            price: 55.0,
            category: "gamepads",
            imageURL: URL(fileURLWithPath: "naconPs4")
        )
    ]
    static let popularItems = [
        Item(
            id: 2,
            name: "Razer Deathadder",
            details: "Connection: USB\nSensor: Optical\nResolution: 6400 DPI\nSwitch type: Razer Mechanical",
            price: 55.0,
            category: "mice",
            imageURL: URL(fileURLWithPath: "razerDeathadder")        ),
        Item(
            id: 3,
            name: "Logitech G-Pro 910",
            details: "Connection: USB\nSensor: Optical\nResolution: 16000 DPI\nPolling rate response: 1000 Hz / 1 ms",
            price: 100.0,
            category: "mice",
            imageURL: URL(fileURLWithPath: "logitechGpro")
        ),
        Item(
            id: 5,
            name: "Logitech F310",
            details: "Connection: USB\nCompatibility: Windows",
            price: 50,
            category: "gamepads",
            imageURL: URL(fileURLWithPath: "logitechF310")
        )
    ]
}
