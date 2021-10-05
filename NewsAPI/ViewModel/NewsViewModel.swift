//
//  NewsViewModel.swift
//  NewsAPI
//
//  Created by Fathan Akram on 04/10/21.
//

import Foundation
import SwiftyJSON
import Combine

class NewsViewModel: ObservableObject {
    @Published var data = [News]()
    
    init(){
        let url = "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=31403e958efb44f19100634eb4c502ea"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!){(data, _, error) in
            if error != nil{
                print((error?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            let articles = json["articles"].array!
            
            for article in articles{
                DispatchQueue.main.async {
                    self.data.append(
                        News(
                            title: article["title"].stringValue,
                            image: article["urlToImage"].stringValue,
                            desc: article["description"].stringValue
                        )
                    )
                }
                
            }
        }.resume()
    }
    
}



