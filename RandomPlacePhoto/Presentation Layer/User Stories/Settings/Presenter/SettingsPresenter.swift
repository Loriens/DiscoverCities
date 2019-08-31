//
//  SettingsPresenter.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

class SettingsPresenter: SettingsPresenterInput, SettingsViewOutput {
    
    // MARK: - Props
    weak var view: SettingsViewInput?
    var router: SettingsRouterInput?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - SettingsPresenterInput
    
    // MARK: - SettingsViewOutput
    func showPrivacyPolicy() {
        let site = Site(title: AppLocalization.Settings.privacyPolicy.localized, url: AppConfiguration.privacyPolicyUrl)
        router?.pushSafariViewController(with: site)
    }
    
    // MARK: - Module functions
}
