//
//  SimpleImageCache.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 1/23/21.
//

import Foundation
import UIKit

class SimpleImageCache {
    
    static var shared = SimpleImageCache()
    
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}
