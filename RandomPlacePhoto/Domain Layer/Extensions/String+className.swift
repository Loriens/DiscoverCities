//
//  String+className.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

extension String {
    
    public static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last ?? ""
    }
    
}
