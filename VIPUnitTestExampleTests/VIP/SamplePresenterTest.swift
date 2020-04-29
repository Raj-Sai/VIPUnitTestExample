//
//  SamplePresenterTest.swift
//  VIPUnitTestExampleTests
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright © 2563 Amsaraj Mariyappan. All rights reserved.
//

import XCTest
@testable import VIPUnitTestExample

class SamplePresenterTest: XCTestCase {
    
    var sut: SamplePresenter!

    override func setUp() {
        super.setUp()
        sut = makeSUT()
    }

    override func tearDown() {
        
    }
    
    func makeSUT() -> SamplePresenter {
        return SamplePresenter()
    }
    
    class SampleViewSpy: SampleView {
        
        var displayRenderViewIsCalled = false
        
        func displayRenderView(aDisplay: SampleModels.ViewModel.Displayed) {
            displayRenderViewIsCalled = true
        }
    }
    
    func testPresentView_ShouldDisplayRenderView() {
        
        // Given
        let viewSpy = SampleViewSpy()
        sut.viewController = viewSpy
        
        // When
        sut.presentView()
        
        // Then
        XCTAssertTrue(viewSpy.displayRenderViewIsCalled)
        
    }


}
