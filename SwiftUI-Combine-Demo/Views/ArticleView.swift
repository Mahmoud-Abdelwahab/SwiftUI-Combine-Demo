//
//  ArticleView.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 19/07/2021.
//

import SwiftUI
import Combine
import URLImage
struct ArticleView: View {
    var article: Article
    
    var body: some View{
        HStack{
            if let imageURL = article.image,
               let url = URL(string: imageURL){
                URLImage(url) {
                    // This view is displayed before download starts
                    EmptyView()
                } inProgress: { progress in
                    // Display progress
                    Text("Loading...")
                } failure: { error, retry in
                    // Display error and retry button
                    VStack {
                        PlaceHolderImageView()
                        Button("Retry", action: retry)
                    }
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                
                
            }else{
                // when fail to find image url show placholder image
                PlaceHolderImageView()
            }
            // Title and description text
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(article.articleDescription ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
            })
            
        }
    }
}


struct  PlaceHolderImageView:View {
    var body: some View{
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.articel)
            .previewLayout(.sizeThatFits)
    }
}
