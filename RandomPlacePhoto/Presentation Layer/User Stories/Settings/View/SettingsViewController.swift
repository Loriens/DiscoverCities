//
//  SettingsViewController.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var privacyPolicyButton: UIButton!
    @IBOutlet private weak var closeSettingsButton: UIButton!
    
    // MARK: - Props
    var output: SettingsViewOutput?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - SettingsViewInput
    
}

// MARK: - Setup functions
extension SettingsViewController {
    
    func setupComponents() {
        privacyPolicyButton.setTitle(AppLocalization.Settings.privacyPolicy.localized, for: .normal)
        closeSettingsButton.setTitle(AppLocalization.General.close.localized, for: .normal)
    }
    
    func setupActions() {
        privacyPolicyButton.addTarget(self, action: #selector(privacyPolicyButtonPressed), for: .touchUpInside)
        closeSettingsButton.addTarget(self, action: #selector(closeSettingsButtonPressed), for: .touchUpInside)
    }
    
    func applyStyles() {
        contentView.apply(.roundedStyle())
        privacyPolicyButton.apply(.accentMainStyle())
        closeSettingsButton.apply(.accentMainStyle())
    }
    
}

// MARK: - Actions
extension SettingsViewController {
    
    @objc
    func privacyPolicyButtonPressed() {
        output?.showPrivacyPolicy()
    }
    
    @objc
    func closeSettingsButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Module functions
extension SettingsViewController { }
