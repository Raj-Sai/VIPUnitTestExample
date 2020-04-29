//
//  SampleInteractorTest.swift
//  VIPUnitTestExampleTests
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright © 2563 Amsaraj Mariyappan. All rights reserved.
//

import XCTest
@testable import VIPUnitTestExample

class SampleInteractorTest: XCTestCase {
    
    var sut: SampleInteractor!

    override func setUp() {
        super.setUp()
        sut = makeSUT()
    }

    override func tearDown() {
        super.tearDown()
    }

    func makeSUT() -> SampleInteractor {
        return SampleInteractor()
    }
    
    class SamplePresenterSpy: SamplePresenterInterface {
        
        var presentViewIsCalled = false
        
        func presentView() {
            presentViewIsCalled = true
        }
    }
    
    class SampleWorkerSpy: SampleWorker {
        
        var getSomeThingIsCalled = false
        
        override func getSampleData(aQueryString: String, aCompletion: @escaping (SampleModels.Response) -> Void) {
            getSomeThingIsCalled = true
            
            aCompletion(SampleModels.Response(name: "Raj", email: "xxx@gmail.com", password: "1122"))
        }
    }
    
    func testViewDidLoad_shouldCallPresentView() {
        // Given
        let samplePresenterSpy = SamplePresenterSpy()
        sut.presenter = samplePresenterSpy
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(samplePresenterSpy.presentViewIsCalled)
        
    }
    
    func testGetData_ShouldCalledWorkerAndShouldCalledPresenter() {
        // Given
        let samplePresenterSpy = SamplePresenterSpy()
        sut.presenter = samplePresenterSpy
        
        let sampleWorker = SampleWorkerSpy(with: SampleService())
        sut.worker = sampleWorker
        
        // When
        sut.getSampleData(aRequest: SampleModels.Request())
        
        // Then
        XCTAssertTrue(sampleWorker.getSomeThingIsCalled)
        XCTAssertTrue(samplePresenterSpy.presentViewIsCalled)
        
    }

}
