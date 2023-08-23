//
//  TicketDate.swift
//  PopCornMovies
//
//  Created by Consultant on 8/18/23.
//

import Foundation
import Foundation
struct TicketDate: Equatable
{
    var day: String
    var month: String
    var year: String
    static var `default`: TicketDate
    {
        TicketDate(day: "", month: "", year: "")
    }
}
