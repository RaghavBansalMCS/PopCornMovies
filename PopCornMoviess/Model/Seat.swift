//
//  Seat.swift
//  PopCornMovies
//
//  Created by Consultant on 8/18/23.
//

import Foundation
struct Seat: Identifiable {
    var id: UUID
    var row: Int
    var number: Int
    
    static var `default`: Seat { Seat(id: UUID(), row: 0, number: 0) }
}
