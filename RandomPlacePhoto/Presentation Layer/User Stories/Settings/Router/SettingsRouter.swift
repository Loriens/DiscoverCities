//
//  SettingsRouter.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class SettingsRouter: SettingsRouterInput {
    
    // MARK: - Props
    weak var view: SettingsViewController?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - SettingsRouterInput
    func pushSafariViewController(with site: Site) {
        let vc = SafariConfigurator.create()
        let viewModelInput = SafariConfigurator.configure(with: vc)
        viewModelInput.configure(with: site)
        
        view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Module functions
}
