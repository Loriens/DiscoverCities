//
//  InternetConnectionError.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct InternetConnectionError: LocalizedError {
    
    var errorDescription: String? {
        return AppLocalization.Error.internerConnection.localized
    }
    
}
