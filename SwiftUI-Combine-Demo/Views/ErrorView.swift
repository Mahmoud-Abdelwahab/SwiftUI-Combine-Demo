//
//  ErrorView.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 19/07/2021.
//

import SwiftUI

struct ErrorView: View {

    typealias ErrorViewAtionHandler = ()-> Void
    let error: Error
    let handel: ErrorViewAtionHandler
    
    internal init(error: Error, handel: @escaping ErrorViewAtionHandler) {
        self.error = error
        self.handel = handel
    }
    
    
    var body: some View {
        VStack {
           Image(systemName: "exclamationmark.icloud")
            .foregroundColor(.gray)
            .font(.system(size: 50, weight: .heavy))
            
            Text("Oooops")
                .foregroundColor(.black)
                .font(.system(size: 30,weight: .heavy))
            
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(4)

            Button(action: {}, label: {
                Text("Retry")
            })
            .frame(width: 50, height: 20)
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 20))
            .cornerRadius(10)
          
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError){}.previewLayout(.sizeThatFits)
    }
}
