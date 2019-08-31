//
//  MainRouter.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class MainRouter: MainRouterInput {
    
    // MARK: - Props
    weak var view: MainViewController?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - MainRouterInput
    func presentPhotoViewController(with image: UIImage?) {
        let vc = PhotoConfigurator.create()
        let moduleInput = PhotoConfigurator.configure(with: vc)
        moduleInput.configure(with: image)
        
        let nc = BasicNavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .overFullScreen
        nc.modalTransitionStyle = .crossDissolve
        
        view?.navigationController?.present(nc, animated: true, completion: nil)
    }
    
    // MARK: - Module functions
}
