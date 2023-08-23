//
//  FakeMovieManager.swift
//  PopCornMoviesTests
//
//  Created by Consultant on 8/23/23.
//

import Foundation

@testable import PopCornMovies
final class FakeMovieManager{
    
    
   var  movies = [Movie]()
    
    
    func getMovies(urlString:String){
        FakeNetworkManager<MoviesModel>.sharedInstance(urlRequest:urlString) { output in
            switch output{
            case.success(let movieModel):
                self.movies = movieModel.results
               
            case.failure(let error):
                print(error)
            }
        }
    }
        
}
    
    

