//
//  UiTest.swift
//  GaNaDaUITests
//
//  Created by 백대홍 on 2022/12/17.
//

import XCTest

final class UiTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func test_Vocabulary() {
        
        let app = XCUIApplication()
        app.tabBars["탭 막대"].buttons["Vocabulary"].tap()
        
        let collectionViewsQuery2 = app.collectionViews
        let collectionViewsQuery = collectionViewsQuery2
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Type the Word"]/*[[".cells.textFields[\"Type the Word\"]",".textFields[\"Type the Word\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Type the Word"]/*[[".cells.textFields[\"Type the Word\"]",".textFields[\"Type the Word\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("asdaasd")  // 단어 입력 텍스트 필드 테스트
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Type the Meaning"]/*[[".cells.textFields[\"Type the Meaning\"]",".textFields[\"Type the Meaning\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Type the Meaning"]/*[[".cells.textFields[\"Type the Meaning\"]",".textFields[\"Type the Meaning\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("WW")  // 단어 뜻 입력 텍스트 필드 테스트
        collectionViewsQuery2.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).matching(identifier: "즐겨찾기").element(boundBy: 2).tap()
    
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Save"]/*[[".cells.buttons[\"Save\"]",".buttons[\"Save\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap() // 저장 버튼 테스트
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
