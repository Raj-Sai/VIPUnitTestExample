//
//  SampleConfigurator.swift
//  VIPUnitTestExample
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright (c) 2563 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

final class SampleConfigurator {

  // MARK: - Object lifecycle

  static let sharedInstance = SampleConfigurator()

  // MARK: - Configuration

  func configure(viewController: SampleViewController) {
    let router = SampleRouter()
    router.viewController = viewController

    let presenter = SamplePresenter()
    presenter.viewController = viewController

    let interactor = SampleInteractor()
    interactor.presenter = presenter

    viewController.interactor = interactor
    viewController.router = router
  }
}
