//
//  VPCodingChallengeTests.swift
//  VPCodingChallengeTests
//
//  Created by intelliswift on 11/4/16.
//  Copyright © 2016 Krishna. All rights reserved.
//

import XCTest
@testable import VPCodingChallenge

class VPCodingChallengeTests: XCTestCase {
    let viewController = VPSearchWeatherViewController()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSearchCity() {
        viewController.searchCity(cityName: "San Jose")
        
    }
}
