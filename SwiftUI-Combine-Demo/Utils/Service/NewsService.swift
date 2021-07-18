//
//  NewsService.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 18/07/2021.
//

import Foundation
import Combine

protocol NewsService {
    func getNews()-> AnyPublisher<NewsResponse,APIError>
}
