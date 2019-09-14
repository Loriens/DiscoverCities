//
//  SafariConfigurator.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum SafariConfigurator {
    
    // Create and return controller
    static func create() -> SafariViewController {
        return SafariViewController(nibName: SafariViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: SafariViewController) -> SafariPresenterInput {
        let presenter = SafariPresenter()
        
        let router = SafariRouter()
        router.view = reference
        
        presenter.view = reference
        presenter.router = router
        
        reference.output = presenter
        
        return presenter
    }
    
}
