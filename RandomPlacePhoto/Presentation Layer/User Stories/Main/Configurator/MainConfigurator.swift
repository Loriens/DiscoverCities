//
//  MainConfigurator.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum MainConfigurator {
    
    // Create and return controller
    static func create() -> MainViewController {
        return MainViewController(nibName: MainViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: MainViewController) -> MainPresenterInput {
        let presenter = MainPresenter()
        
        let router = MainRouter()
        router.view = reference
        
        presenter.view = reference
        presenter.router = router
        
        reference.output = presenter
        
        return presenter
    }
    
}
