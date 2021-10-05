//
//  ContentView.swift
//  NewsAPI
//
//  Created by Fathan Akram on 04/10/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct ContentView: View {
    @ObservedObject var newsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationView{
            List(newsViewModel.data){ item in
                NavigationLink(destination: NewsDetail(news: item)){
                    HStack{
                        if item.image != ""{
                            WebImage(url: URL(string: item.image)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120,height:170)
                                .background(Image("loader")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 60, height: 30))
                                .cornerRadius(10)
                                
                        }else{
                            Text("No Image")
                                .frame(width: 120,height:170)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                        
                        VStack(alignment: .leading, spacing: 7){
                            Text(item.title).bold().lineLimit(5)
                            Text(item.desc).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            
                        }
                        
                    }
                }
                
            }.navigationBarTitle("News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
