//
//  NewsResponse.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 18/07/2021.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable, Identifiable{
    
    let id = UUID()
    let author: String?
    let url: String?
    let title: String?
    let articleDescription: String?
    let urlToImage: String?
    let publishedAt: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, title
        case articleDescription = "description"
        case urlToImage, publishedAt
    }
}


// Dummy Data
extension Article {
    static let articel = Article(author: "Mahmoud abdulwahab",
                                 url: "https://www.nbcnews.com/news/us-news/facebook-suggests-it-s-more-effective-biden-vaccinations-n1274286",
                                 title: "Facebook suggests it's more effective than Biden on vaccinations - NBC News",
            articleDescription: "Facebook on Saturday took a second shot at the White House after President Biden said \"they're killing people\" with misinformation on vaccines.",
            urlToImage:  "https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/newscms/2019_01/2705191/nbc-social-default.png",
            publishedAt: Date())
}
