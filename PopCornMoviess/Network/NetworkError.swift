//
//  NetworkError.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import Foundation


enum NetworkError:Error{
    
    case inValidError
    case doNotFoundError
    case parsingError
    case responseError
}

extension NetworkError:LocalizedError,Equatable{
    var errorDescription: String?{
        switch self {
            
        case .inValidError:
            return NSLocalizedString("Api EndPoint Wrong", comment: "inValidError")
        case .doNotFoundError:
            return NSLocalizedString("data not found Wrong", comment: "doNotFoundError")
            
        case .parsingError:
            return NSLocalizedString("data not parsed", comment: "parsingError")
        case .responseError:
            return NSLocalizedString("Response Error", comment: "ResponseError")
        }
        
    }
}
