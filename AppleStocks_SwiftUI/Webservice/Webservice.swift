//
//  Webservice.swift
//  AppleStocks_SwiftUI
//
//  Created by Ashish Tyagi on 09/12/20.
//

import Foundation

class Webservice {
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        
        let url = URL(string: "https://island-bramble.glitch.me/stocks")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
            
        }.resume()
        
    }
    
    
    func getTopNews(completion: @escaping (([Article]?) -> Void)) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
                   fatalError("URL is not correct")
               }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            
            DispatchQueue.main.async {
                completion(articles)
            }
        }.resume()
    }
}
