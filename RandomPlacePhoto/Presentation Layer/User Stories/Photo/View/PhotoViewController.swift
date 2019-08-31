//
//  PhotoViewController.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 31/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, PhotoViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var photoImageView: UIImageView!
    
    // MARK: - Props
    var output: PhotoViewOutput?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.loadData()
        
        setupComponents()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - PhotoViewInput
    func updateImage(with image: UIImage?) {
        DispatchQueue.main.async {
            self.photoImageView.image = image
        }
    }
    
}

// MARK: - Setup functions
extension PhotoViewController {
    
    func setupComponents() { }
    
    func setupActions() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(photoLongPressed))
        let tap = UITapGestureRecognizer(target: self, action: #selector(photoTapped))
        
        photoImageView.isUserInteractionEnabled = true
        photoImageView.addGestureRecognizer(longPress)
        photoImageView.addGestureRecognizer(tap)
    }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension PhotoViewController {
    
    @objc
    func photoLongPressed(_ sender: Any) {
        guard let image = photoImageView.image else { return }

        output?.sharePhoto(with: image)
    }
    
    @objc
    func photoTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Module functions
extension PhotoViewController { }
