//
//  SampleViewController.swift
//  VIPUnitTestExample
//
//  Created by Amsaraj Mariappan on 29/4/2563 BE.
//  Copyright (c) 2563 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

protocol SampleView: AnyObject {
    func displayRenderView(aDisplay: SampleModels.ViewModel.Displayed)
}

class SampleViewController: UIViewController {

    var interactor: SampleInteractorInterface!
    var router: SampleRouterInterface!
    
    @IBOutlet weak var lablel: UILabel!
    @IBAction func render(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SampleConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.viewDidLoad()
    }
}

// MARK: - SampleViewController
extension SampleViewController: SampleView {
    func displayRenderView(aDisplay: SampleModels.ViewModel.Displayed) {
        // TODO: Update UI
        lablel.text = aDisplay.name
    }
}

