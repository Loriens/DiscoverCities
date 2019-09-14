//
//  PhotoConfigurator.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum PhotoConfigurator {
    
    // Create and return controller
    static func create() -> PhotoViewController {
        return PhotoViewController(nibName: PhotoViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: PhotoViewController) -> PhotoPresenterInput {
        let presenter = PhotoPresenter()
        
        let router = PhotoRouter()
        router.view = reference
        
        presenter.view = reference
        presenter.router = router
        
        reference.output = presenter
        
        return presenter
    }
    
}
