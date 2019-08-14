//
//  AppDelegate.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 12/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import FlickrKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - UIApplicationDelegate
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setup(application)
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.setup(window)
        
        return true
    }
    
    // MARK: - Application configuration
    private func setup(_ application: UIApplication) {
        FlickrKit.shared().initialize(withAPIKey: AppConfiguration.flickrApiKey, sharedSecret: AppConfiguration.flickrSecretKey)
    }
    
    // MARK: - Window configuration
    private func setup(_ window: UIWindow) {
        let vc = MainConfigurator.create()
        _ = MainConfigurator.configure(with: vc)
        
        let nc = BasicNavigationController(rootViewController: vc)
        
        self.window = window
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
    
}
