//
//  AdiCarCustomiserUITests.swift
//  AdiCarCustomiserUITests
//
//  Created by Adi Timblo on 18/01/2024.
//

import XCTest

final class AdiCarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresAndExhaustPackageOtherTwoUpgradesAreDisabled() throws {
        // arrange
        let app = XCUIApplication()
        app.launch()
        
        //act
        let collectionViewsQuery = XCUIApplication().collectionViews
        
        
        collectionViewsQuery.switches["Exhaust Package Cost: $500"].switches["0"].tap()
        collectionViewsQuery.switches["Tires Package Cost: $500"].switches["0"].tap()
                
                      
        
        //assert
        XCTAssertEqual(collectionViewsQuery.switches["Brakes Package Cost: $500"].switches["0"].isEnabled,false)
        XCTAssertEqual(collectionViewsQuery.switches["Engine Package Cost: $1000"].switches["0"].isEnabled,false)
        
    }

    
    func testCheckDisplayResetWhenChangeCar() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //act
      
        app.buttons["Next Car"].tap()
        let collectionViewsQuery = XCUIApplication().collectionViews
        
        //assert
        XCTAssertEqual(collectionViewsQuery.switches["Brakes Package Cost: $500"].switches["0"].isEnabled,true)
        XCTAssertEqual(collectionViewsQuery.switches["Engine Package Cost: $1000"].switches["0"].isEnabled,true)
        XCTAssertEqual(collectionViewsQuery.switches["Brakes Package Cost: $500"].switches["0"].isEnabled,true)
        XCTAssertEqual(collectionViewsQuery.switches["Engine Package Cost: $1000"].switches["0"].isEnabled,true)
        
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
