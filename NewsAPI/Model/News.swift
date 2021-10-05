//
//  News.swift
//  NewsAPI
//
//  Created by Fathan Akram on 04/10/21.
//

import Foundation


struct News: Identifiable{
    var id = UUID()
    var title : String
    var image : String
    var desc : String
}
