//
//  SamplePresenter.swift
//  VIPUnitTestExample
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright (c) 2563 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

protocol SamplePresenterInterface {
    func presentView()
}

class SamplePresenter: SamplePresenterInterface {
    weak var viewController: SampleView!
    
    func presentView() {
        let modelData = SampleModels.ViewModel.Displayed(name: "Raj", email: "xx@gmail.com", password: "23hfr")
        viewController.displayRenderView(aDisplay: modelData)
    }
}

