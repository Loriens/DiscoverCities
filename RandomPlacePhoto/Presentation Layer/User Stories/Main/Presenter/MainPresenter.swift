//
//  MainPresenter.swift
//  RandomPlacePhoto
//
//  Created by Vladislav on 13/08/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import FlickrKit
import UIKit

// TODO: - Добавить случайный выбор страницы при поиске новых фотографий
class MainPresenter: MainPresenterInput, MainViewOutput {
    
    // MARK: - Props
    weak var view: MainViewInput?
    var router: MainRouterInput?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - MainPresenterInput
    
    // MARK: - MainViewOutput
    func loadData() {
        guard Reachability.isConnectedToNetwork() else {
            Toast.instance.show(title: AppLocalization.General.error.localized, message: AppLocalization.Error.internerConnection.localized)
            return
        }
        guard let city = CityStorage.getRandomCity() else { return }
        
        getPhotos(city: city)
    }
    
    func selectImage(with image: UIImage) {
        router?.presentPhotoViewController(with: image)
    }
    
    // MARK: - Module functions
    func getPhotos(city: City) {
        let searchPhotos = FKFlickrPhotosSearch()
        searchPhotos.text = city.name + " " + AdditionalSearchKey.key
        searchPhotos.page = "1"
        searchPhotos.per_page = "5"
        searchPhotos.content_type = "1"
        searchPhotos.sort = "relevant"
        
        FlickrKit.shared().call(searchPhotos) { (response, error) in
            guard let response = response,
                error == nil else {
                    self.provideError(with: error)
                    return
            }
            
            if let photos = response["photos"] as? [AnyHashable: Any],
                let photoArray = photos["photo"] as? [[AnyHashable: Any]] {
                var photoURLs: [URL] = []
                for photoDictionary in photoArray {
                    let photoURL = FlickrKit.shared().photoURL(for: FKPhotoSize.medium500, fromPhotoDictionary: photoDictionary)
                    
                    photoURLs.append(self.fixPhotoUrl(url: photoURL))
                }
                
                self.providePhotos(city: city, photos: photoURLs)
            } else {
                self.providePhotos(city: city, photos: [])
            }
        }
    }
    
    func providePhotos(city: City, photos: [URL]) {
        guard !photos.isEmpty else {
            loadData()
            return
        }
        
        view?.updateCity(with: city)
        view?.updatePhotoSlider(with: photos)
    }
    
    func provideError(with error: Error?) { }
    
    func fixPhotoUrl(url: URL) -> URL {
        var absouluteUrl = url.absoluteString
        
        if let lastCharacter = absouluteUrl.lastIndex(of: "_") {
            absouluteUrl.remove(at: lastCharacter)
            if let newUrl = URL(string: absouluteUrl) {
                return newUrl
            }
        }
        
        return url
    }
    
}
