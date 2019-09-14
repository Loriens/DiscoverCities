//
//  PhotoRouter.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class PhotoRouter: PhotoRouterInput {
    
    // MARK: - Props
    weak var view: PhotoViewController?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - PhotoRouterInput
    func presentShareDisplay(with filesToShare: [Any]) {
        let activityViewController = UIActivityViewController(activityItems: filesToShare, applicationActivities: nil)
        
        view?.navigationController?.present(activityViewController, animated: true)
    }
    
    // MARK: - Module functions
}
