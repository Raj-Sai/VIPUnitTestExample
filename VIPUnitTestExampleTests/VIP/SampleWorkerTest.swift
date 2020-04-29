//
//  SampleWorkerTest.swift
//  VIPUnitTestExampleTests
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright © 2563 Amsaraj Mariyappan. All rights reserved.
//

import XCTest
@testable import VIPUnitTestExample

class SampleWorkerTest: XCTestCase {
    
    var sut: SampleWorker!
    var testResponse: SampleModels.Response!

    override func setUp() {
        super.setUp()
        sut = makeSUT()
        testResponse = SampleModels.Response(name: "Raj", email: "xx@gmail.com", password: "12345")
    }

    override func tearDown() {
    }
    
    func makeSUT() -> SampleWorker {
        return SampleWorker(with: SampleServiceSpy())
    }
    
    
    class SampleServiceSpy: SampleService {
        var getSomeThingIsCalled = false
        
        override func requestSampleData(aSuccess: @escaping (SampleModels.Response) -> (), aFailure: @escaping (String?) -> ()) {
            getSomeThingIsCalled = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
              aSuccess(SampleModels.Response(name: "Raj", email: "xx@gmail.com", password: "12345"))
            }
        }
    }
    
    func testGetSampleData_ShouldReturnResponseData() {
        
        // Given
        let sampleService = SampleServiceSpy()
        
        sut.service = sampleService
        
        // When
        var responseData = SampleModels.Response()
        let expect = expectation(description: "Wait for fetchOrders() to return")
        
        sut.getSampleData(aQueryString: "") { (reponse) in
            responseData = reponse
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 1.1)
        
        // then
        XCTAssertTrue(sampleService.getSomeThingIsCalled)
        XCTAssertEqual(responseData.name, testResponse.name)
        
    }

}
