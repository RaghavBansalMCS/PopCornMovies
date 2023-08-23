//
//  GenreModel.swift
//  PopCornMovies
//
//  Created by Consultant on 8/18/23.
//

import Foundation

struct GenreModel: Codable {
    var genres: [Genre]
}

struct Genre: Codable, Identifiable {
    var id: Int?
    var name: String?
}

extension Genre: Equatable {
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name
    }
}
