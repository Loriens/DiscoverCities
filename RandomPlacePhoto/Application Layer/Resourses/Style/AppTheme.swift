//
//  AppTheme.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 12/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum AppTheme {
    
    // MARK: - Status bar style
    public static var statusBarStyle: UIStatusBarStyle {
        switch AppThemeManager.current.type {
        case .light:
            return .default
        case .dark:
            return .lightContent
        }
    }
    
    // MARK: - Window background color
    public static var backgroundMain: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "F3F4F9", alpha: 1.0)
        case .dark:
            return UIColor(hex: "2A2A30", alpha: 1.0)
        }
    }
    
    // MARK: - Accent color of the app
    public static var accentMain: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "6686f7", alpha: 1.0)
        case .dark:
            return UIColor(hex: "CE1F1F", alpha: 1.0)
        }
    }
    
    // MARK: - Text color on accent background
    public static var accentText: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor.darkGray
        case .dark:
            return UIColor(hex: "FFFFFF", alpha: 1.0)
        }
    }
    
    // MARK: - Main text color
    public static var textMain: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor.gray
        case .dark:
            return UIColor(hex: "D0D0D1", alpha: 1.0)
        }
    }
    
}
