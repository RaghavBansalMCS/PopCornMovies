//
//  TabBarImages.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import Foundation


enum TabbedItems: Int, CaseIterable{
    case Movies = 0
    case Favorites
    case Discovery
    
    
    var title: String{
        switch self {
        case .Movies:
            return "Movies"
        case .Favorites:
            return "Favorites"
        case .Discovery:
            return "Discovery"
        }
    }
    
    var iconName: String{
        switch self {
        case .Movies:
            return "icons8-movies-50"
        case .Favorites:
            return "icons8-wish-list-50"
        case .Discovery:
            return "icons8-movie-projector-50"
            
        }
    }
}
