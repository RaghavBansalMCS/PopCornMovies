//
//  MovieURL.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import Foundation

enum MovieURL:String{
    case nowPlaying = "now_playing"
    case upcoming = "upcoming"
    case popular = "popular"
    
    public var urlString:String{
        "\(MovieDownloadManager.baseURL)\(self.rawValue)?api_key=\(API.APIKey)&language=en-US&page=1"
    }
    
}

