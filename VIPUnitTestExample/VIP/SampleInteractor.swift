//
//  SampleInteractor.swift
//  VIPUnitTestExample
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright (c) 2563 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

protocol SampleInteractorInterface {
    func viewDidLoad()
}

final class SampleInteractor: SampleInteractorInterface {
    
    var presenter: SamplePresenterInterface!
    var worker: SampleWorker = SampleWorker(with: SampleService())

    func viewDidLoad() {
        presenter.presentView()
    }
    
    func getSampleData(aRequest: SampleModels.Request) {
    
        worker.getSampleData(aQueryString: "") { (response) in
            self.presenter.presentView()
        }
    }

}

