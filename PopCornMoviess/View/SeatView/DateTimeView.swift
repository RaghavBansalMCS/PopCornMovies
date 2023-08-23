//
//  DateTimeView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/18/23.
//

import Foundation
import SwiftUI

struct DateTimeView: View {

    @State private var selectedDate: TicketDate = TicketDate.default
    @State private var selectedHourndex: Int = -1
    private let dates = Date.getFollowingThirtyDays()

    @Binding var date: TicketDate
    @Binding var hour: String

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            createDateView()
            createTimeView()
        }    }

    fileprivate func createDateView() -> some View{
        VStack(alignment: .leading) {
            Text("Date")
                .font(.headline).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(dates, id: \.day){ date in
                        DateView(date: date, isSelected: self.selectedDate.day == date.day, onSelect: { selectedDate in
                            self.selectedDate = selectedDate
                            self.date = selectedDate
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }

    fileprivate func createTimeView() -> some View {

        VStack(alignment: .leading) {
            Text("Time").font(.headline).padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<24, id: \.self){ i in
                        TimeView(index: i, isSelected: self.selectedHourndex == i, onSelect: { selectedIndex in
                            self.selectedHourndex = selectedIndex
                            self.hour = "\(selectedIndex):00"
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }

}

extension Date{
    
     static var thisYear: Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let component = formatter.string(from: Date())
        
        if let value = Int(component) {
            return value
        }
        return 0
    }
    
    private static func getComponent(date: Date, format: String) -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = format
        formatter.locale = Locale.autoupdatingCurrent
           let component = formatter.string(from: date)
           return component
    }
    
    static func getFollowingThirtyDays(for month: Int = 1) -> [TicketDate]{
        var dates = [TicketDate]()
        let dateComponents = DateComponents(year: thisYear , month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
let range = calendar.range(of: .day, in: .month, for: date)!
        
        for i in range{
            guard let fullDate = calendar.date(byAdding: DateComponents(day: i) , to: Date()) else { continue }
            let d = getComponent(date: fullDate, format: "dd")
            let m = getComponent(date: fullDate, format: "MM")
            let y = getComponent(date: fullDate, format: "yy")
            let ticketDate = TicketDate(day: d, month: m, year: y)
            dates.append(ticketDate)
        }
        
        return dates
        
    }
}


struct DateTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeView(date: .constant(TicketDate.default), hour: .constant(""))
    }
}

