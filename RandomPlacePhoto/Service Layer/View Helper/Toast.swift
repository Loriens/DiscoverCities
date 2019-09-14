//
//  Toast.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import Toast_Swift

class Toast {
    
    static let instance: Toast = Toast()
    
    init() {
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = UIColor(hex: "a9a9a9", alpha: 0.7)
        style.cornerRadius = 5.0
        style.displayShadow = true
        style.titleAlignment = .center
        style.messageAlignment = .center
        style.maxWidthPercentage = 0.8
        ToastManager.shared.style = style
        ToastManager.shared.isTapToDismissEnabled = true
        ToastManager.shared.isQueueEnabled = false
    }
    
    func show(title: String, message: String) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.makeToast(message, duration: 3.0, position: .center, title: title, image: nil, style: ToastManager.shared.style, completion: nil)
        }
    }
    
    func show(title: String, message: String, duration: Double) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.makeToast(message, duration: duration, position: .center, title: title, image: nil, style: ToastManager.shared.style, completion: nil)
        }
    }
    
    func show(message: String) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.makeToast(message, duration: 3.0, position: .center, title: nil, image: nil, style: ToastManager.shared.style, completion: nil)
        }
    }
    
    func show(message: String, viewController: UIViewController) {
        DispatchQueue.main.async {
            viewController.view.makeToast(message, duration: 3.0, position: .top, title: nil, image: nil, style: ToastManager.shared.style, completion: nil)
        }
    }
    
    func showFull(message: String, viewController: UIViewController) {
        DispatchQueue.main.async {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: viewController.view.frame.width, height: viewController.view.frame.height))
            view.backgroundColor = .white
            viewController.view.addSubview(view)
            view.makeToast(message, duration: 3.0, position: .top, title: nil, image: nil, style: ToastManager.shared.style, completion: nil)
        }
    }
    
}
