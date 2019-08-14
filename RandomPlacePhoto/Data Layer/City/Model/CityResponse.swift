//
//  CityResponse.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 14/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct CityResponse: Codable {
    
    var name: String?
    var lat: String?
    var lng: String?
    
    func defaultMapping() -> City? {
        guard let lat = Double(self.lat ?? ""),
            let lng = Double(self.lng ?? "") else {
                return nil
        }
        
        return City(name: self.name ?? "", lat: lat, lng: lng)
    }
    
}
