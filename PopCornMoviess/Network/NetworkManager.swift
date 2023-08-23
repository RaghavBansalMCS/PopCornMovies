//
//  NetworkManager.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import Foundation
import Alamofire
import Combine

final class NetworkManager<T:Codable>{
    static func sharedInstance(from urlString:String, completionHandler:@escaping(Result<T,NetworkError>) -> Void){
        AF.request(urlString).responseDecodable(of: T.self) { response in
            if response.error != nil{
                completionHandler(.failure(NetworkError.responseError))
                print(response.error?.localizedDescription as Any)
                return
            }
            if let payload = response.value {
                completionHandler(.success(payload))
                print(payload)
                return
            }
            completionHandler(.failure(NetworkError.doNotFoundError))

        }

    }
//    static func sharedInstance(from urlString:String) -> AnyPublisher<MoviesModel,NetworkError> {
//        return AF.request(urlString,method: .get)
//                     .publishDecodable(type: MoviesModel.self)
//                     .value()
//                     .mapError { _ in NetworkError.inValidError }
//                     .eraseToAnyPublisher()
//    }
    
    
    
}
