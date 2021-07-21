//
//  NewsEndpoint.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 18/07/2021.
//

import Foundation


/// 5614c04cf9914455b96ff3cfb714a6a4

/// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5614c04cf9914455b96ff3cfb714a6a4
protocol APIBuilder {
    var urlRequest: URLRequest{get}
    var baseURL: URL?{get}
    var path: String{ get}
}

enum NewsAPI{
    case getNews
}

extension NewsAPI: APIBuilder{
    var urlRequest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: (self.baseURL?.appendingPathComponent(self.path))!)
        }
    }
    
    var baseURL: URL? {
        switch self {
        
        case .getNews:
            var component = URLComponents(string: "https://newsapi.org/v2")!
            component.queryItems = [
                URLQueryItem(name: "country", value: "eg"),
                URLQueryItem(name: "category", value: "business"),
                URLQueryItem(name: "apiKey", value: "5614c04cf9914455b96ff3cfb714a6a4")
            ]
            component.percentEncodedQuery = component.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            return component.url
        }
    }
    
    var path: String {
        switch self {
        
        case .getNews:
            return "/top-headlines"
        }
    }
    
    
}
