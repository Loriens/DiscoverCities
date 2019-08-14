//
//  StyleWrapper+UIView.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 14/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIView {
    
    static func infoStyle() -> StyleWrapper {
        return .wrap { view in
            view.layer.cornerRadius = 50.0
            view.clipsToBounds = true
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    static func roundedStyle(radius: CGFloat = 4.0) -> StyleWrapper {
        return .wrap { view in
            view.layer.cornerRadius = radius
            view.clipsToBounds = true
        }
    }
}
