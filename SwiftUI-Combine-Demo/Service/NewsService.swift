//
//  NewsService.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 18/07/2021.
//

import Foundation
import Combine

protocol NewsService {
    func getNews(for endPoint: NewsAPI)->AnyPublisher<NewsResponse,APIError>
}

struct NewsServiceImp: NewsService{
    
    func getNews(for endPoint: NewsAPI)->AnyPublisher<NewsResponse,APIError>{
        return URLSession.shared.dataTaskPublisher(for: endPoint.urlRequest)
            .receive(on: RunLoop.main)
            .mapError{_ in APIError.unKnown}
            .flatMap{ data, response->AnyPublisher<NewsResponse,APIError> in
                
                guard let response = response as? HTTPURLResponse else{
                    return Fail(error: APIError.unKnown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode){
                    // Succsess
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    // to decoding Jsondate to Date Type
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError{ _ in APIError.decodingError}
                        .eraseToAnyPublisher()
                    
                }else{
                    //Error
                    return Fail(error: APIError.statusCode(response.statusCode)).eraseToAnyPublisher()
                }
                
            }.eraseToAnyPublisher()
    }
    
}

