//
//  MainViewController.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController, MainViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var infoView: UIView!
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var cityImageView: UIImageView!
    
    // MARK: - Props
    var output: MainViewOutput?
    var animator: UIViewPropertyAnimator!
    
    private var photosURLs: [URL] = []
    
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
    
    func setupActions() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(imageViewPanGestureHandler))
        panGestureRecognizer.minimumNumberOfTouches = 1
        cityImageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    func applyStyles() {
        cityNameLabel.apply(.bigTitleStyle())
        infoView.apply(.infoStyle())
        cityImageView.isUserInteractionEnabled = true
    }
    
    // MARK: - MainViewInput
    func updateCity(with city: City) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = city.name
        }
    }
    
    func updatePhotoSlider(with photos: [URL]) {
        photosURLs = photos
        
        addPhoto()
    }
    
}

// MARK: - Actions
extension MainViewController {
    
    @objc
    func imageViewPanGestureHandler(recognizer: UIPanGestureRecognizer) {
        UIView.animate(withDuration: 0.2) {
            self.cityImageView.center = recognizer.location(in: self.view)
        }
    }
    
}

// MARK: - Module functions
extension MainViewController {
    
    func addPhoto() {
        guard !photosURLs.isEmpty else { return }
        let url = photosURLs.removeFirst()
        
        DispatchQueue.main.async {
            self.cityImageView.kf.setImage(with: url) { _ in
                self.cityImageView.setNeedsLayout()
            }
        }
    }
    
}
