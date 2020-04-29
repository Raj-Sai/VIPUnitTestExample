//
//  SampleModels.swift
//  VIPUnitTestExample
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright (c) 2563 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

struct SampleModels {
    // Data struct sent to Interactor
    struct Request {}
    
    // Data struct sent to Presenter
    struct Response {
        var name: String?
        var email: String?
        var password: String?
    }
    
    // Data struct sent to ViewController
    struct ViewModel {
        struct Displayed {
            var name: String
            var email: String
            var password: String
        }
    }
}
