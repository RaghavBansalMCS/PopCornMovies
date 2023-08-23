//
//  MovieDownloadManager.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import Foundation

final class MovieDownloadManager:ObservableObject{
    
    
    @Published var  movies = [Movie]()
    @Published var  cast = [Cast]()
    @Published var genres = [Genre]()
    @Published var favoriteMovies = [Movie]()
    @Published var watchedMovies = [Movie]()
    
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    
    func getNowPlaying(){
        getMovies(Movieurl: .nowPlaying)
        
    }
    
    func getUpcoming(){
        getMovies(Movieurl: .upcoming)
    }
    func getPopular(){
        getMovies(Movieurl: .popular)
        
    }
    
    
    
    func getCast(for movie:Movie){
        let urlString = "\(MovieDownloadManager.baseURL)\(movie.id ?? 100)/credits?api_key=\(API.APIKey)&language=en-US"
        NetworkManager<CastModel>.sharedInstance(from:urlString)
        { output in
            switch output{
            case.success(let castModel):
                self.cast = castModel.cast
                
            case.failure(let error):
                print(error)
            }
            
        }
        
    }
    
    func getMovies(Movieurl:MovieURL){
       NetworkManager<MoviesModel>.sharedInstance(from: Movieurl.urlString) { output in
            switch output{
            case.success(let movieModel):
                self.movies = movieModel.results
               
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func getGenres() {
        let urlString = "\(MovieDownloadManager.baseURL)?api_key=\(API.APIKey)&language=en-US"
        NetworkManager<GenreModel>.sharedInstance(from:urlString) { output in
            switch output {
            case .success(let response):
                self.genres = response.genres
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
    func getGenreById(id: Int) -> String {
        if genres.isEmpty {
            getGenres()
        }
        
        for genreSample in genres {
            if(genreSample.id == id)
            {
                return(genreSample.name ?? "-")
            }
        }
        return ""
    }
    
}
    
    

