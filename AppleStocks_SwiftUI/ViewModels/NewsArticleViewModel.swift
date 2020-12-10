//
//  NewsArticleViewModel.swift
//  AppleStocks_SwiftUI
//
//  Created by Ashish Tyagi on 10/12/20.
//

import Foundation

struct NewsArticleViewModel {
    
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
    
}
