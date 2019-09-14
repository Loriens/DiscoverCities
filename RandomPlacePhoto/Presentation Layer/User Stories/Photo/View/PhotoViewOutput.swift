//
//  PhotoViewOutput.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PhotoViewOutput {
    func loadData()
    func sharePhoto(with image: UIImage)
}
