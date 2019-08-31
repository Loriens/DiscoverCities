//
//  AppLocalization.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 12/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AppLocalization {
    
    enum General: String, Localizable {
        case ok = "OK"
        case save = "Save"
        case cancel = "Cancel"
        case next = "Next"
        case error = "Error"
        case close = "Close"
    }
    
    enum Theme: String, Localizable {
        case light = "AppThemeLight"
        case dark = "AppThemeDark"
    }
    
    enum Language: String, Localizable {
        case english = "AppLanguageEnglish"
        case russian = "AppLanguageRussian"
    }
    
    enum Error: String, Localizable {
        case internerConnection = "InternetConnectionError"
    }
    
    enum Main: String, Localizable {
        case nextCity = "MainNextCityTitle"
    }
    
    enum Settings: String, Localizable {
        case privacyPolicy = "SettingsPrivacyPolicy"
    }
    
}
