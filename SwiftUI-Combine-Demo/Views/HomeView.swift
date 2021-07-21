//
//  HomeView.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 18/07/2021.
//

import SwiftUI

struct HomeView: View {
    
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
                    List(articles){
                        ArticleView(article: $0)
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }.onAppear(perform: newsViewModel.getArticles)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
