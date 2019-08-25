//
//  MainViewController.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import Kingfisher

// TODO: - Добавить рамку к изображениям
class MainViewController: UIViewController, MainViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var infoView: UIView!
    @IBOutlet private weak var cityNameLabel: UILabel!
    
    // MARK: - Props
    var output: MainViewOutput?
    var animator: UIViewPropertyAnimator!
    
    private var removedView: UIView?
    private var photosURLs: [URL] = []
    private var countOfPhotos = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.loadData()
        
        setupComponents()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        view.backgroundColor = AppTheme.backgroundMain
    }
    
    func setupActions() { }
    
    func applyStyles() {
        cityNameLabel.apply(.bigTitleStyle())
        infoView.apply(.infoStyle())
    }
    
    // MARK: - MainViewInput
    func updateCity(with city: City) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = city.name
        }
    }
    
    func updatePhotoSlider(with photos: [URL]) {
        photosURLs = photos
        countOfPhotos += photos.count
        
        addPhotos()
    }
    
}

// MARK: - Actions
extension MainViewController {
    
    @objc
    func imageViewPanGestureHandler(recognizer: UIPanGestureRecognizer) {
        let screenWidth = UIScreen.main.bounds.width
        let translationX = recognizer.translation(in: view).x
        let translationY = recognizer.translation(in: view).y
        let velocity: CGPoint = recognizer.velocity(in: view)
        let hypotenuseVelocity: CGFloat = hypot(velocity.x, velocity.y)
        
        if (abs(translationX) > screenWidth / 2 || hypotenuseVelocity > 1000.0) && recognizer.state == .ended {
            UIView.animate(withDuration: 0.5, animations: {
                recognizer.view?.center.x += translationX > 0 ? screenWidth : -screenWidth
                recognizer.view?.center.y += translationY
            }) { _ in
                recognizer.view?.removeFromSuperview()
            }
            
            guard removedView != recognizer.view else { return }
            removedView = recognizer.view
            
            countOfPhotos -= 1
            if countOfPhotos <= 0 {
                output?.loadData()
            }
        } else if recognizer.state == .ended {
            UIView.animate(withDuration: 0.2, animations: {
                recognizer.view?.center = self.view.center
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                recognizer.view?.center.x = self.view.center.x + translationX
                recognizer.view?.center.y = self.view.center.y + translationY
            })
        }
    }
    
}

// MARK: - Module functions
extension MainViewController {
    
    func addPhotos() {
        while !photosURLs.isEmpty {
            let url = photosURLs.removeFirst()
            
            DispatchQueue.main.async { [weak self] in
                guard let imageView = self?.createImageViewForPhoto() else { return }
                
                imageView.kf.setImage(with: url) { _ in
                    imageView.setNeedsDisplay()
                    imageView.frame = imageView.getScaledImageSize() ?? CGRect(x: 0, y: 0, width: 0, height: 0)
                    imageView.apply(.roundedStyle())
                }
            }
        }
    }
    
    private func createImageViewForPhoto() -> UIImageView {
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.imageViewPanGestureHandler))
        panGestureRecognizer.minimumNumberOfTouches = 1
        imageView.addGestureRecognizer(panGestureRecognizer)
        
        return imageView
    }
    
}
