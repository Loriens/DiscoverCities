//
//  UIViewController+identifier.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    public class var identifier: String {
        return String.className(self)
    }
    
}
