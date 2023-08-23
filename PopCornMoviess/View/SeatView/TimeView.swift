//
//  TimeView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/18/23.
//

import Foundation
import SwiftUI

struct TimeView: View {
    var index: Int
    var isSelected: Bool
    var onSelect: ((Int)->()) = {_ in }


    var body: some View {
        Text("\(index):00")
            .foregroundColor(isSelected ? .white : .black)
            .padding()
            .background( isSelected ? Color.accentColor : Color.gray.opacity(0.3))
            .cornerRadius(10).onTapGesture {
                self.onSelect(self.index)
        }
    }
}
