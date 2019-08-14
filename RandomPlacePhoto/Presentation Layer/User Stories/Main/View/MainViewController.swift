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
    
    var collectionView: UICollectionView!
    
    // MARK: - Props
    var output: MainViewOutput?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.output?.loadData()
        self.setupComponents()
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.view.backgroundColor = AppTheme.backgroundMain
    }
    
    func applyStyles() {
        self.cityNameLabel.apply(.bigTitleStyle())
        self.infoView.apply(.infoStyle())
        
        guard let collectionView = self.collectionView,
            let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    // MARK: - MainViewInput
    func updateCity(with city: City) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = city.name
        }
    }
    
    func updatePhotoSlider(with photos: [URL]) { }
    
}

// MARK: - Actions
extension MainViewController { }

// MARK: - Module functions
extension MainViewController { }

// MARK: - Module UIViewControllerTransitioningDelegate
extension MainViewController: UIViewControllerTransitioningDelegate { }
