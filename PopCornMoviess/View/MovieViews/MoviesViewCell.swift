//
//  MoviesViewCell.swift
//  PopCornMovies
//
//  Created by Consultant on 8/16/23.
//

import SwiftUI

struct MoviesViewCell: View {
    @EnvironmentObject var favourites:Favourites
    @Environment(\.managedObjectContext)  var managedObjContext
    
    var movie = Movie()
    var body: some View {
        HStack(alignment: .top, spacing: 20){
            AsyncImage(url: URL(string:movie.posterPath)!){
                Rectangle().foregroundColor(Color.gray.opacity(0.4))
            }image: { (img) -> Image in
                Image(uiImage: img)
                    .resizable()
                
            }
            .frame(width:120, height:180)
            .transition(.opacity)
            .scaledToFit()
            .cornerRadius(20)
            .shadow(radius: 15)
            
            
            VStack(alignment: .leading, spacing:0){
                Text(movie.titleWithLanguage)
                    .font(.title3)
                    .bold().italic()
                    .foregroundColor(.red)
                
                HStack{
                    ZStack{
                        Circle()
                            .trim(from: 0, to: CGFloat(movie.voteAverage))
                            .stroke(Color.red, lineWidth: 4)
                            .frame(width:50)
                            .rotationEffect(.degrees(-90))
                        
                        Circle()
                            .trim(from: 0, to: 1)
                            .stroke(Color.red.opacity(0.2), lineWidth: 4)
                            .frame(width:50)
                            .rotationEffect(.degrees(-90))
                        
                        Text(String.init(format: "%0.2f", movie.vote_average ?? 0.0))
                            .foregroundColor(.red)
                            .font(.subheadline)
                        
                        
                    }.frame(height:70)
                    
                    Text(movie.release_date ?? "")
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .bold().italic()
                    
                   
                }
                
                Text(movie.overview ?? "")
                    .font(.system(size: 9))
                    .bold().italic()
                    .foregroundColor(Color.red)
                    .frame(width: 120,height:50)
                
                Button("Save"){
                    DataController().addNote(id:movie.id!,overview: movie.overview!, posterPath: movie.posterPath, release_date: movie.release_date!, titleWithLanguage: movie.titleWithLanguage, vote_average: movie.vote_average!, context: managedObjContext)
                    print("DataBase path", URL.documentsDirectory)
                   
                }.buttonStyle(.borderless)
                    .frame(width:60,height:40)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(20)
                Spacer()
                
                
                
            }
        }
        
    }
}

struct MoviesViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MoviesViewCell()
    }
}
