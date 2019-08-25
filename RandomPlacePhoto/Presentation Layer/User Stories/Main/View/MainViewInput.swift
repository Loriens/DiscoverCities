//
//  MainViewInput.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewInput: class {
    func updateCity(with city: City)
    func updatePhotoSlider(with photos: [URL])
}
