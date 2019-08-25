//
//  StyleWrapper+UIButton.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 25/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIButton {
    
    static func accentMainStyle() -> StyleWrapper {
        return .wrap { button in
            button.titleLabel?.textAlignment = .center
            button.apply(.roundedStyle(radius: 20.0))
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = AppTheme.accentMain
            button.titleLabel?.font = PTRootUI.bold.font(size: 20)
        }
    }
    
}
