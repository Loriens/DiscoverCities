//
//  MainViewOutput.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol MainViewOutput {
    func loadData()
    func selectImage(with image: UIImage)
    func showSettings()
}
