//
//  Stocks.swift
//  AppleStocks_SwiftUI
//
//  Created by Ashish Tyagi on 09/12/20.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}

struct Article: Decodable {
    let title: String
    let imageURL: String
    let publication: String
}

