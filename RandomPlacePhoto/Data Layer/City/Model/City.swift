//
//  City.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

class City {
    
    var name: String
    var lat: Double
    var lng: Double
    
    init(name: String, lat: Double, lng: Double) {
        self.name = name
        self.lat = lat
        self.lng = lng
    }
    
}
