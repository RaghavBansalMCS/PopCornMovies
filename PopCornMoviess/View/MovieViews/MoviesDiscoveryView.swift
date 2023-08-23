//
//  MoviesDiscoveryView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import SwiftUI

struct MoviesDiscoveryView: View {
    @State private var  offset:CGFloat = 0
    @State private var index = 0
    @EnvironmentObject var favourites:Favourites
    @StateObject private var moviedownloadManager = MovieDownloadManager()
    
    let spacing :CGFloat = 10
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:spacing){
                    ForEach(moviedownloadManager.movies){ movie in
                        ZStack(alignment: .bottom){
                            AsyncImage(url: URL(string: movie.posterPath)!){
                                Rectangle().foregroundColor(Color.gray.opacity(0.4))

                            }image: { (img) -> Image in
                                Image(uiImage: img)
                                    .resizable()
                            }
                                .transition(.opacity)
                                .scaledToFill()
                                .frame(width:  UIScreen.main.bounds.width * 0.9,height:UIScreen.main.bounds.height * 0.75)
                                .cornerRadius(25)
                                .shadow(radius: 15)
                                .overlay(
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.clear, .clear]), startPoint: .center, endPoint: .bottom))
                                        .clipped()
                                
                                )
                                .cornerRadius(12.0)
                            //------------
                            VStack(alignment: .leading){
                                Spacer()
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(movie.titleWithLanguage)
                                            .font(.title).bold().italic()
                                            .fontWeight(.semibold)
                                            .foregroundColor(.red)
                                            .padding(.horizontal)
                                            .padding(.top)
                                        
                                       
                                    }
                                    
                                    Text(movie.overview ?? "")
                                        .font(.system(size: 16))
                                        .bold().italic()
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.red)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    NavigationLink {
                                        MovieDetailView(movie: movie)
                                            .environmentObject(favourites)
                                    } label: {
                                        Text("Details")
                                            .bold()
                                            .italic()
                                            .padding()
                                            .foregroundColor(Color.black)
                                            .background(Color.red)
                                            .cornerRadius(12)
                                    }.padding()

                                    
                                    
                                    
                                }
                                .background(Color.white.opacity(0.6))
                                    .cornerRadius(12.0)
                                    .lineLimit(5)
                                
                                //---------------
                            }.padding()
                            //---------
                            
                            
                        }.shadow(radius: 12.0)
                         .cornerRadius(12.0)
                        
                    }
                    .frame(width: geo.size.width, height:geo.size.height * 1.05)
                }
            }
            .content.offset(x: self.offset)
            .frame(width: geo.size.width, alignment: .leading)
            .gesture(
                  DragGesture()
                    .onChanged({ (value) in
                        self.offset = value.translation.width - geo.size.width * CGFloat(index)
                    }).onEnded({ value in
                        if -value.predictedEndTranslation.width > geo.size.width / 2, index < moviedownloadManager.movies.count - 1{
                            index += 1
                        }
                        if value.predictedEndTranslation.width > geo.size.width / 2, index > 0 {
                            index -= 1
                        }
                        withAnimation {
                            offset = -(geo.size.width + spacing) * CGFloat(index)
                        }
                    })
            )
            .onAppear(){
                moviedownloadManager.getPopular()
            }
            
        }
    }
}

struct MoviesDiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesDiscoveryView()
    }
}
