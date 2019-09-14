//
//  Loader.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class Loader {
    
    var indicator: NVActivityIndicatorView?
    
    convenience init(view: UIView) {
        let screenSize = UIScreen.main.bounds
        let height: CGFloat = 44
        
        self.init(view: view, top: screenSize.height / 2 - height / 2)
    }
    
    init(view: UIView, top: CGFloat) {
        let screenSize = UIScreen.main.bounds
        let width: CGFloat = 44
        let height: CGFloat = 44
        let x: CGFloat = screenSize.width / 2 - width / 2
        let y: CGFloat = top
        let indicator = NVActivityIndicatorView(frame: CGRect(x: x, y: y, width: width, height: height))
        view.addSubview(indicator)
        indicator.color = AppTheme.accentMain
        self.indicator = indicator
        self.hide()
    }
    
    func show() {
        DispatchQueue.main.async {
            self.indicator?.type = .ballRotateChase
            self.indicator?.startAnimating()
            self.indicator?.alpha = 1.0
        }
    }
    func hide() {
        DispatchQueue.main.async {
            self.indicator?.stopAnimating()
            self.indicator?.alpha = 0.0
        }
    }
    
}
