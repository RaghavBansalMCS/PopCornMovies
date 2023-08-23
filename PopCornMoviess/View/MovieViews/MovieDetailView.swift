//
//  MovieDetailView.swift
//  PopCornMovies
//
//  Created by Consultant on 8/16/23.
//

import SwiftUI

struct MovieDetailView: View {

    @EnvironmentObject var favourites:Favourites
    @State var isFavourite = false
    
    @StateObject var loader:ImageLoader
    @StateObject var moviedownloadManager = MovieDownloadManager()
    var movie: Movie
    @State private var  offset:CGFloat = 0
    @State private var animationAmount = 1.0

    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var showSeats: Bool = false
    
    
    init(movie: Movie) {
        self.movie = movie
        _loader = StateObject(wrappedValue: ImageLoader(url: URL(string: movie.posterPath)!, cache: Environment(\.imageCache).wrappedValue))
        
        
    }
    
    
    var body: some View {
        ZStack(alignment: .top){
            backgroundView
            //----
           
            GeometryReader{ geo in
                ScrollView(.vertical, showsIndicators: false){
                    HStack(spacing:10){
                        ZStack(alignment: .bottom){
                            PosterView
                                .transition(.opacity)
                                .scaledToFill()
                                .frame(width:  UIScreen.main.bounds.width * 0.95,height:UIScreen.main.bounds.height * 1)
                                .cornerRadius(25)
                                .shadow(radius: 15)
                                .overlay(
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [.clear, .clear]), startPoint: .center, endPoint: .bottom))
                                        .clipped()
                                    
                                )
                                .cornerRadius(12.0)
                            
                            VStack(alignment: .leading){
                                Spacer()
                                VStack(alignment: .leading){
                                    HeaderView
                                    Detail
                                    OverView
                                    ChooseSeats
                                    Spacer()
                                    
                                }
                                
                                .background(Color.white.opacity(0.5))
                                .frame(width:UIScreen.main.bounds.width * 0.95,height:UIScreen.main.bounds.height * 0.40)
                                .cornerRadius(12.0)
                                
                               //
                            }.padding()
                            
                        }
                        .shadow(radius: 12.0)
                        .cornerRadius(12.0)
                    }
                    .frame(width: geo.size.width, height:geo.size.height * 0.95)
                    CastView
                }
                
                
            }
                
                
            
        
            
            //------
        }.edgesIgnoringSafeArea(.all)
        
           
    }
    
  
    
    //-------
    private var backgroundView: some View{
        ImageView.onAppear(){
            loader.load()
        }.blur(radius: 10)
        
    }
    //-------
    private var ImageView: some View{
        Group{
            if loader.image != nil{
                Image(uiImage: loader.image!)
                    .resizable()
            }else{
                Rectangle().foregroundColor(Color.gray.opacity(0.4))
            }
        }
       
    }
    //------
    private var HeaderView: some View{
        VStack(){
            Text(movie.titleWithLanguage)
                .font(.title).bold().italic()
            
              
                
        
           
            
        }.foregroundColor(.red)
            .padding(.horizontal, 90)
            .padding(.top)
            
    }
    //------
    private var PosterView: some View{
        HStack(alignment: .center){
            Spacer()
            Group{
                if loader.image != nil{
                    Image(uiImage: loader.image!)
                        .resizable()
                }else{
                    Rectangle().foregroundColor(Color.gray.opacity(0.4))
                }
            }
            
            
        }
        
    }
    
   //------
    private var OverView: some View{
        Text(movie.overview ?? "-")
            .font(.system(size: 16))
            .bold().italic()
            .lineLimit(6)
            .fontWeight(.regular)
            .foregroundColor(Color.red)
            .padding(.horizontal)
            .padding(.top)
        
    }
    
    private var Detail: some View {

            HStack() {
                Text("\(moviedownloadManager.getGenreById(id: movie.genreId))")
                    .font(.system(size: 18))
                    .foregroundColor(.red)
                Spacer()
                Text("\(movie.adult ?? false ? "18+" : "12+")")
                    .font(.system(size: 18))
                    .foregroundColor(.red)
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.red)
                
                Text(String(format: "%.1f", Double(movie.voteAverage)))
                    .font(.system(size: 18))
                    .foregroundColor(.red)
               Spacer()
                Text("\(movie.release_date ?? "-")")
                    .font(.system(size: 18))
                    .foregroundColor(.red)
                Spacer()
                Button{
                    self.isFavourite.toggle()
                    if isFavourite == true{
                       favourites.addToCart(prodMain: movie)
                       
                    }else{
                        favourites.RemoveFromCart(prodMain: movie)
                    }
                   
                }label:{
                    Image(systemName:isFavourite ? "heart.fill": "heart")
                        .foregroundColor(.red)
                        
                   
                }.padding(5)
                
                
    
              
                
        }
            
    }

    
    //-----
    private var ChooseSeats: some View{
        LCButton(text: "Choose seats") {
            self.showSeats.toggle()
        }.sheet(isPresented: self.$showSeats) {
            SeatView(movie: self.movie, showSeats: $showSeats)
        }.padding(.horizontal, 50)
         .bold()
         .italic()
    }
    
    private var CastView: some View{
        VStack(alignment: .leading){
            Text("Cast").foregroundColor(.red).font(.title2).bold().italic()
                .padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 20){
                    ForEach(moviedownloadManager.cast){ cast in
                        VStack{
                            AsyncImage(url: URL(string: cast.profilePhoto)!){
                                Rectangle()
                                
                            }image: { (img) -> Image in
                                Image(uiImage: img)
                                    .resizable()
                            }.frame(width: 100, height:140)
                                .animation(
                                    .easeInOut(duration: 0.5)
                                        .delay(1),
                                    value: animationAmount
                                )
                                .transition(.opacity)
                                .scaledToFill()
                                .cornerRadius(15)
                                .shadow(radius: 15)
                            
                            Text("\(cast.name ?? "-") as \(cast.character ?? "-")")
                                .font(.caption).bold().italic()
                                .foregroundColor(.white)
                                .frame(width: 100)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                    }
                }
            }
        }
        .task(){
            moviedownloadManager.getCast(for: movie)
        }
        .frame(width:  UIScreen.main.bounds.width * 0.95)
        
        
   
    }
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie())
    }
}
