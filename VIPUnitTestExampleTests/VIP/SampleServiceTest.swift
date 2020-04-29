//
//  SampleServiceTest.swift
//  VIPUnitTestExampleTests
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright © 2563 Amsaraj Mariyappan. All rights reserved.
//

import XCTest
@testable import VIPUnitTestExample

class SampleServiceTest: XCTestCase {
    
    var sut: SampleService!
    var responseTestData: SampleModels.Response!

    override func setUp() {
        super.setUp()
        sut = SampleService()
        responseTestData = SampleModels.Response(name: "Raj", email: "xx@gmail.com", password: "122345")
    }

    override func tearDown() {
    }
    
    func testRequestSampleData_ShouldRetunResponseData() {
        
        // when
        let expect = expectation(description: "Wait for fetchOrders() to return")
        sut.requestSampleData(aSuccess: { (response) in
            expect.fulfill()
        }) { (error) in
            expect.fulfill()

        }
        waitForExpectations(timeout: 1.0)

    }

}
