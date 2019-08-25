//
//  UIImageView+getScaledImageSize.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 25/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension UIImageView {
    
    /// Retrieve the scaled size of the image within this ImageView.
    /// - Returns: A CGRect representing the size of the image after scaling or nil if no image is set.
    func getScaledImageSize() -> CGRect? {
        if let image = self.image {
            return AVMakeRect(aspectRatio: image.size, insideRect: self.frame)
        }

        return nil
    }
    
}
