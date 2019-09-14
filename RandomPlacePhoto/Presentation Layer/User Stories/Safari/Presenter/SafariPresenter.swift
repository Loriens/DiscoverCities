//
//  SafariPresenter.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

class SafariPresenter: SafariPresenterInput, SafariViewOutput {
    
    // MARK: - Props
    weak var view: SafariViewInput?
    var router: SafariRouterInput?
    
    private var site: Site?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - SafariPresenterInput
    func configure(with data: Any?) {
        if let site = data as? Site {
            self.site = site
        }
    }
    
    // MARK: - SafariViewOutput
    func loadData() {
        guard let site = self.site else { return }
        view?.updateSite(with: site)
    }
    
    // MARK: - Module functions
}
