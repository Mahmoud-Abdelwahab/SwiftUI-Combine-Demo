//
//  HomeView.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 18/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openURL
    @StateObject var newsViewModel = NewsViewModel(service: NewsServiceImp())
    
    var body: some View {
        Group{
            switch newsViewModel.state{
            case .loading:
                ProgressView()
            case .Failed(let error):
                ErrorView(error: error, handel: newsViewModel.getArticles)
            case .Success(let articles):
                NavigationView {
                    List(articles){ article in
                        ArticleView(article: article)
                            .onTapGesture {loadWebPage(url: article.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }.onAppear(perform: newsViewModel.getArticles)
    }
    
    func loadWebPage(url: String?){
        guard let url = url,let websiteURL = URL(string: url) else {return}
        openURL(websiteURL)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
