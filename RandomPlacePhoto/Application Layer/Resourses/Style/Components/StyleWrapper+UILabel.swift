//
//  StyleWrapper+UILabel.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 12/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UILabel {
    
    static func bigTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.textAlignment = .center
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = PTRootUI.bold.font(size: 20.0)
            label.textColor = AppTheme.accentText
        }
    }
    
    static func smallTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = PTRootUI.medium.font(size: 16.0)
            label.textColor = AppTheme.textMain
        }
    }
    
}
