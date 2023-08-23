//
//  CastModel.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import Foundation


struct CastModel: Codable {
    var cast: [Cast]
}

struct Cast: Codable, Identifiable {
    var id: Int?
    var name: String?
    var character: String?
    var profile_path: String?
    var profilePhoto: String {
        if let path = profile_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }
        return "https://picsum.photos/200/300"
    }
}
