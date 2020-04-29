//
//  SampleWorker.swift
//  VIPUnitTestExample
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright (c) 2563 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

protocol SampleWorkerInterface {
  func getSomething(aQueryString: String, aCompletion: @escaping (SampleModels.Response) -> Void)
}

class SampleWorker {

    var service: SampleService!
    
    init(with aService: SampleService) {
        service = aService
    }

  // MARK: - Business Logic

    func getSampleData(aQueryString: String, aCompletion: @escaping (SampleModels.Response) -> Void) {
        service.requestSampleData(aSuccess: { (response) in
            aCompletion(response)
        }) { (aErrorCode) in
            if let code = aErrorCode {
                print(code)
            }
        }
    }
}
