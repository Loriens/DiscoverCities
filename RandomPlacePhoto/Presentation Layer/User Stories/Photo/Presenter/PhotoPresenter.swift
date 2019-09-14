//
//  PhotoPresenter.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class PhotoPresenter: PhotoPresenterInput, PhotoViewOutput {
    
    // MARK: - Props
    weak var view: PhotoViewInput?
    var router: PhotoRouterInput?
    
    private var image: UIImage?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - PhotoPresenterInput
    func configure(with data: Any?) {
        if let image = data as? UIImage {
            self.image = image
        }
    }
    
    // MARK: - PhotoViewOutput
    func loadData() {
        view?.updateImage(with: image)
    }
    
    func sharePhoto(with image: UIImage) {
        guard let jpgImageData = image.jpegData(compressionQuality: 1.0),
            let jpgImageURL = jpgImageData.dataToFile(fileName: "photo.jpg") else {
                return
        }

        router?.presentShareDisplay(with: [jpgImageURL])
    }
    
    // MARK: - Module functions
}
