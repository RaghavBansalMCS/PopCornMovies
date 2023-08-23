//
//  FavouritesView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/21/23.
//

import Foundation
import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var favourites:Favourites
    @State var loading:Bool = true
    var body: some View {
        ScrollView{
            Text("Your Favourites List")
                .font(.title).italic().bold()
                .foregroundColor(.red)
            if favourites.prod.count > 0 {
                ForEach(favourites.prod, id: \.id){
                    movie in
                    MovieFavouriteCell(movie: movie)
                        .environmentObject(favourites)
                }
                
                
            }
            }
           
        .redacted(reason: loading ? .placeholder: [])
    
        .onAppear(){
            Task{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    loading = false
                }
            }
    }
        }
    
        
    }


struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environmentObject(Favourites())
    }
}
