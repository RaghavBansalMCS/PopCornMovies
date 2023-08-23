//
//  SeatView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/18/23.
//

import Foundation
import AlertToast
import SwiftUI

struct SeatView: View {
    @State var movie: Movie
    @State private var selectedSeats: [Seat] = []
    @State private var showBasket: Bool = false
    @State private var date: TicketDate = TicketDate.default
    @State private var hour: String = ""
    @State private var showPopup = false
    @State private var showTicket: Bool = false
    @Binding var showSeats: Bool
    @State private var showToast = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                DateTimeView(date: self.$date, hour: self.$hour)
                TheatreView(selectedSeats: self.$selectedSeats).padding(.top, 40)
                LCButton(text: "Continue") {
                    if(selectedSeats.count != 0 && !date.day.isEmpty && hour != ""){
                        self.showTicket.toggle()
                    }
                    else{
                        showToast.toggle()
                    }
                }.sheet(isPresented: self.$showTicket) {
                    Ticket(movie: self.movie, selectedSeats: self.$selectedSeats, date: self.$date, hour: self.$hour, showTicket: $showTicket, showSeats: $showSeats)
                }
                .padding(.horizontal)
                

            }
            .toast(isPresenting: $showToast){
                AlertToast(type: .error(Color.yellow), title: "Please select Date, Hour and Seat!")
            }
            .padding(.top, 40)
            .navigationBarTitle("")
        }

    }
    
}


