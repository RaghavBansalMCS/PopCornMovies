//
//  ImageCache.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import Foundation
import UIKit

protocol ImageCache{
    subscript(_ url: URL) -> UIImage? {get set}
}

struct TemporaryImageCache: ImageCache{
   
    private let cache: NSCache<NSURL, UIImage> = {
        let cache = NSCache<NSURL, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    subscript(url: URL) -> UIImage? {
        get {
            cache.object(forKey: url as NSURL)
        }
        set {
            newValue == nil ? cache.removeObject(forKey: url as NSURL) : cache.setObject(newValue!, forKey: url as NSURL)
        }
    }
    
    
}
