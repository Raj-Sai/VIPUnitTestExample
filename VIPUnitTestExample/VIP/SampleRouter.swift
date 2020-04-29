//
//  SampleRouter.swift
//  VIPUnitTestExample
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright (c) 2563 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

protocol SampleRouterInterface {
  func navigateToViewController()
}

final class SampleRouter: SampleRouterInterface {
  weak var viewController: SampleViewController!

  // MARK: - Navigation

    func navigateToViewController() {
        // TODO: Navigate to viewController
    }
}
