//
//  SampleViewControllerTest.swift
//  VIPUnitTestExampleTests
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright © 2563 Amsaraj Mariyappan. All rights reserved.
//

import XCTest
@testable import VIPUnitTestExample

class SampleViewControllerTest: XCTestCase {
    
    var sut: SampleViewController!
    var window: UIWindow!

    override func setUp() {
        super.setUp()
        window = UIWindow()
        sut = makeSUT()
        
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func makeSUT() -> SampleViewController {
        let storyboard = UIStoryboard(name: "SampleStoryboard", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "SampleViewController") as! SampleViewController
        sut.loadViewIfNeeded()
        return sut
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    class SampleInteractorInterfaceSpy: SampleInteractorInterface {
        
        // MARK: Method call expectations
        
        var viewDidLoadCalled = false
        
        // MARK: Spied methods
        
        func viewDidLoad() {
            viewDidLoadCalled = true
        }
    }
    
    func testIsCalledViewDidLoad() {
        
        let sampleInteractorInterfaceSpy = SampleInteractorInterfaceSpy()
        sut.interactor = sampleInteractorInterfaceSpy
        loadView()
        
        // when
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(sampleInteractorInterfaceSpy.viewDidLoadCalled, "Called intracter viewdidload from view controller")
    }
    
    func testShouldDisplayRenderView() {
        
        // When
        let displayModel = SampleModels.ViewModel.Displayed(name: "Raj", email: "sss@gmail.com", password: "1234")
        
        sut.displayRenderView(aDisplay: displayModel)
        
        // Then
        XCTAssertEqual(sut.lablel.text, "Raj")
    }
}
