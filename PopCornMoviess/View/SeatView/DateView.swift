//
//  DateView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/18/23.
//

import Foundation

import SwiftUI

struct DateView: View {
    var date: TicketDate = TicketDate(day: "03", month: "11", year: "20")
    var isSelected: Bool
    var onSelect: ((TicketDate)->()) = {_ in }
    
    
    var body: some View {
        VStack {
            Text("\(date.day)")
                .font(.title)
                .bold()
                .foregroundColor(isSelected ? .white : .black)
            
            Text("\(date.month)/\(date.year)")
                .foregroundColor(isSelected ? .white : .primary)
                .font(.callout)
                .padding(.top, 10)
            
        }.padding()
            .background( isSelected ? Color.accentColor: Color.gray.opacity(0.3))
            .clipShape(DateShape())
            .cornerRadius(10)
            .onTapGesture {
                self.onSelect(self.date)
        }
    }
}
struct DateShape: Shape {

    var cutRadius: CGFloat = 5
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y ))
            path.addLine(to: CGPoint(x: rect.width, y: rect.origin.y))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - rect.height / 4))
            path.addArc(center: CGPoint(x: rect.width, y: rect.height - rect.height / 4 + cutRadius), radius: cutRadius, startAngle: Angle(degrees: -90) , endAngle: Angle(degrees: 90) , clockwise: true)
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height))
            path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height - rect.height / 4 + cutRadius * 2))
            path.addArc(center: CGPoint(x: rect.origin.x, y: rect.height - rect.height / 4 + cutRadius), radius: cutRadius, startAngle: Angle(degrees: 90) , endAngle: Angle(degrees: -90) , clockwise: true)
            path.closeSubpath()
            
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(isSelected: false )
    }
}
