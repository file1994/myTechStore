//
//  myTechStoreUITests.swift
//  myTechStoreUITests
//
//  Created by Filip Stojanovic on 23.05.22.
//

import XCTest

class myTechStoreUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
   
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        
        
        // UITest 1 - prvo u "Products" meniju klikcemo na prvu kategoriju, a to je "Mice", a potom biramo drugu opciju iz menija, a nakon toga, putem identifier-a kliknucemo na dugme "Add to Cart"
        
        let categoryCell = app.tables.cells.element(boundBy: 0)
        categoryCell.tap()
        let productCell = app.tables.cells.element(boundBy: 1)
        productCell.tap()
        
        let addToCartButton = app.buttons["btnAddToCart"]
        if !addToCartButton.isHittable {
            app.windows.scrollViews.element.scrollToElement(element: addToCartButton)
        }
        XCTAssertTrue(addToCartButton.isHittable)
        addToCartButton.tap()
        
        let tabBarOrder = app.tabBars.buttons.element(boundBy: 3)
        tabBarOrder.tap()
        
        let numberOfItemsInOrder = app.tables.cells.count
        XCTAssertEqual(numberOfItemsInOrder, 1)
    }
    
    
    // UITest 2 - Prvo se ocekuje isto kao u prvom testu, da se izabere prva opcija iz menija "Products", a to je "Mice", a potom druga opcija iz menija "Mice", a to je "Razer Deathadder", nakon toga, ako su manje dimenzije ekrana i dugme nije vidljivo, najpre ce aplikacija skrolovati dok dugme ne postane vidljivo, a onda kliknuti na "Add to Cart" dugme preko identifier-a, zatim ce kliknuti na cetvrti tab, "Your Cart", i aktivirati pogled iz tog tab-a, a potom opet ako su dimenzije ekrana male, skrolovati dok dugme ne postane vidljivo, a zatim kliknuti na "Submit" dugme preko identifier-a.
    func testExampleTwo() throws {
        let app = XCUIApplication()
        app.launch()
        
        let categoryCell = app.tables.cells.element(boundBy: 0)
        categoryCell.tap()
        let productCell = app.tables.cells.element(boundBy: 1)
        productCell.tap()
        
        let addToCartButton = app.buttons["btnAddToCart"]
        if !addToCartButton.isHittable {
            app.windows.scrollViews.element.scrollToElement(element: addToCartButton)
        }
        XCTAssertTrue(addToCartButton.isHittable)
        addToCartButton.tap()
        
        let tabBarQuery = XCUIApplication().tabBars
        tabBarQuery.buttons["Your Cart"].tap()
        
        let submitOrderButton = app.buttons["btnSubmit"]
        if !submitOrderButton.isHittable {
            app.windows.scrollViews.element.scrollToElement(element: submitOrderButton)
        }
        XCTAssertTrue(submitOrderButton.isHittable)
        submitOrderButton.tap()
        
    }

    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        while !element.isHittable {
            swipeUp()
        }
    }
}
