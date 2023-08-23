//
//  EnvironMentValues.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import Foundation
import SwiftUI

struct ImageCacheKey: EnvironmentKey{
    static let defaultValue: ImageCache = TemporaryImageCache()
    
    
}

extension EnvironmentValues{
    var imageCache:ImageCache{
        get{
            self[ImageCacheKey.self]
        }
        set{
            self[ImageCacheKey.self] = newValue
        }
    }
}
