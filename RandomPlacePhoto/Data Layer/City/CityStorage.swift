//
//  CityStorage.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum CityStorage {
    
    private static var cities: [City] = []
    
    static func loadAll() {
        guard let path = Bundle.main.path(forResource: "cities", ofType: "json"),
            let jsonData = try? NSData(contentsOfFile: path, options: .mappedIfSafe) as Data,
            let cities = try? JSONDecoder().decode([CityResponse].self, from: jsonData) else {
                return
        }
        
        self.cities = cities.compactMap({ $0.defaultMapping() })
    }
    
    static func getAll() -> [City] {
        if cities.isEmpty {
            CityStorage.loadAll()
        }
        
        return cities
    }
    
    static func getRandomCity() -> City? {
        if cities.isEmpty {
            CityStorage.loadAll()
        }
        
        return cities.randomElement()
    }
    
}
