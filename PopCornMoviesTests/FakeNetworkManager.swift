//
//  FakeNetworkManager.swift
//  PopCornMoviesTests
//
//  Created by Consultant on 8/22/23.
//

import Foundation
import Alamofire

@testable import PopCornMovies

class FakeNetworkManager<T:Codable>{
   
    
    static func sharedInstance(urlRequest:String ,completionHandler:@escaping(Result<T,NetworkError>) -> Void){
        let bundle = Bundle(for: FakeNetworkManager.self)
        let urlString = urlRequest
        
        guard let url = bundle.url(forResource: urlString, withExtension: "json") else{
          return
        }
        
        AF.request(url).responseDecodable(of: T.self) { response in
     //-------------------------------------------------------------------------------
//            guard let data = response.data else { return }
//            do {
//                let packages = try JSONDecoder().decode(T.self, from: data)
//                    print(packages)
//                } catch let error {
//                    print(error.localizedDescription)
//                }
     //--------------------------------------------------------------------------------
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
}
