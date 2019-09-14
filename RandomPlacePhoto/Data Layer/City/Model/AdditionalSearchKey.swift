//
//  AdditionalSearchKey.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AdditionalSearchKey {
    
    static private var keys: [String] = [
        "nature",
        "house",
        "city"
    ]
    
    static var key: String {
        return AdditionalSearchKey.keys.randomElement() ?? ""
    }
    
}
