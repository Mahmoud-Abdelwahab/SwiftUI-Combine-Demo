//
//  APIError.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 18/07/2021.
//

import Foundation

enum APIError: Error {
    case decodingError
    case statusCode(Int)
    case unKnown
}


extension APIError: LocalizedError{
    var errorDescription: String?{
        switch self {
      
        case .decodingError:
            return "Faild ro decode the object from the service"
        case .statusCode(let code):
            return "\(code) :- something went wrong..."
        case .unKnown:
            return "the arror is unknown"
        }
    }
}
