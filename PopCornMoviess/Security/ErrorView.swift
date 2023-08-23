//
//  ErrorView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/22/23.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text("Your Code is Jail Broken. Please Fix It")
            .bold().italic()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
