//
//  MovieFavouriteCell.swift
//  PopCornMovies
//
//  Created by Consultant on 8/21/23.
//

import Foundation
import SwiftUI

struct MovieFavouriteCell: View {
    @EnvironmentObject var favourites:Favourites
    var movie = Movie()
    var body: some View {
        ZStack{
            HStack{
                AsyncImage(url: URL(string:movie.posterPath)!){
                    Rectangle().foregroundColor(Color.gray.opacity(0.4))
                }image: { (img) -> Image in
                    Image(uiImage: img)
                        .resizable()
                    
                }
                .frame(width:90,height:95).cornerRadius(10).padding()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
                
                
                
                VStack(alignment: .leading, spacing:10){
                    Text("Title:  \(movie.titleWithLanguage)").bold().font(.caption)
                    Text("Ratings:  \(movie.vote_average ?? 0.0)").bold().font(.caption)
                    Text("Release Date:  \(movie.release_date ?? "")").bold().font(.caption)
                    
                }.padding(0)
                    .foregroundColor(.red)
                    .font(.title3)
                    .bold().italic()
                Spacer()
                
                
                
                
                
            }
        }.background(LinearGradient(gradient: Gradient(colors: [Color.white, .red.opacity(0.4)]) , startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
        
    }
}

struct MovieFavouriteCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieFavouriteCell()
    }
}
