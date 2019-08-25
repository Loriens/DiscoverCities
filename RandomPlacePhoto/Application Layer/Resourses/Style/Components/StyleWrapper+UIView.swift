//
//  StyleWrapper+UIView.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 14/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIView {
    
    static private var defaultCornerRadius: CGFloat {
        return 30.0
    }
    
    static func infoStyle() -> StyleWrapper {
        return .wrap { view in
            view.apply(.roundedStyle())
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    static func roundedStyle(radius: CGFloat = defaultCornerRadius) -> StyleWrapper {
        return .wrap { view in
            view.layer.cornerRadius = radius
            view.clipsToBounds = true
        }
    }
    
}
