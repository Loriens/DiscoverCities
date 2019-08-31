//
//  SettingsConfigurator.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum SettingsConfigurator {
    
    // Create and return controller
    static func create() -> SettingsViewController {
        return SettingsViewController(nibName: SettingsViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: SettingsViewController) -> SettingsPresenterInput {
        let presenter = SettingsPresenter()
        
        let router = SettingsRouter()
        router.view = reference
        
        presenter.view = reference
        presenter.router = router
        
        reference.output = presenter
        
        return presenter
    }
    
}
