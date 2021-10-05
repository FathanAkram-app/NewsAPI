//
//  NewsDetail.swift
//  NewsAPI
//
//  Created by Fathan Akram on 04/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetail: View {
    let news : News
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                if news.image != ""{
                    WebImage(url: URL(string: news.image)!)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                }else{
                    Text("No Image")
                        .frame(width: 150,height:140)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                }
                
                VStack(alignment: .leading, spacing: 20){
                    Text(news.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(news.desc)
                        .font(.body)
                        .fontWeight(.bold)
                    
                    
                }.padding()            }
        }
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail(news: News(title: "", image: "", desc: ""))
    }
}
