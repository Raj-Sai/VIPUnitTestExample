//
//  SampleService.swift
//  VIPUnitTestExample
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright (c) 2563 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class SampleService {

    func requestSampleData(aSuccess: @escaping (SampleModels.Response) -> (), aFailure: @escaping (_ error: String?) -> ()) {

        let response = SampleModels.Response(name: "Raj", email: "xx@gmail.com", password: "2342")
        aSuccess(response)
    }
}
