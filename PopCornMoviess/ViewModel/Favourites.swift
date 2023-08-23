//
//  Favourites.swift
//  PopCornMovies
//
//  Created by Consultant on 8/21/23.
//

import SwiftUI


class Favourites: ObservableObject {
    
    @Published  var prod:[Movie] = []

    
    func addToCart(prodMain:Movie){
        prod.append(prodMain)
        
    }
    
    func RemoveFromCart(prodMain:Movie){
        prod = prod.filter {$0.id != prodMain.id}
        
    }
    
}
