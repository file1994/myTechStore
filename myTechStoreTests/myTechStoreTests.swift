//
//  myTechStoreTests.swift
//  myTechStoreTests
//
//  Created by Filip Stojanovic on 23.05.22.
//

import XCTest
@testable import myTechStore
class myTechStoreTests: XCTestCase {

    // Unit test1 - U testu ispod testirano je koliko ukupno ima kategorija. Ocekivani rezultat su 2 kategorije: "mice" i "gamepads".
    func testGetCategories() {
        let object = ProductViewController()
        object.getCategories()
        XCTAssertEqual(object.categoriesToShow.count, 2)
    }

    // Unit test2 - U testu ispod testirano je koliko ima produkta koji spadaju u kategoriju misevi, "mice", a ocekivani rezultat je 4.
    func testGetProductItems() {
        let object = ItemsTableViewController()
        object.category = "mice"
        object.getProductItems(categoryName: object.category)
        XCTAssertEqual(object.itemsToShow.count, 4)
    }
}
