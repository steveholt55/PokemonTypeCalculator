//
//  ImageLoader.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import Foundation
import Combine
import UIKit

class ImageLoader: ObservableObject {
    
    private let cache = SimpleImageCache.shared
    
    var didChange = PassthroughSubject<UIImage, Never>()
    var image = UIImage() {
        didSet {
            didChange.send(image)
        }
    }

    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.sharedInit(url)
    }
    
    init(url:URL) {
        self.sharedInit(url)
    }
    
    private func sharedInit(_ url: URL) {
        self.loadImage(url)
    }
    
    private func loadImage(_ url: URL) {
        if self.attemptImageFromCache(url: url) {
            return
        }
        self.fetchImage(url)
    }
    
    private func fetchImage(_ url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let loadedImage = UIImage(data: data)  else { return }
            self.cache.set(forKey: url.absoluteString, image: loadedImage)
            DispatchQueue.main.async {
                self.image = loadedImage
            }
        }
        task.resume()
    }
    
    private func attemptImageFromCache(url: URL) -> Bool {
        guard let cachedImage = cache.get(forKey: url.absoluteString) else { return false }
        self.image = cachedImage
        return true
    }
}
