//
//  ContentView.swift
//  AppleStocks_SwiftUI
//
//  Created by Ashish Tyagi on 09/12/20.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var stockListVM = StockListViewModel()
    
    @State private var bottomSheetShown = false
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        UITableView.appearance().tableFooterView = UIView()
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm ) }
        
        return NavigationView {
            
            ZStack(alignment: .leading) {
                
                Color.black.edgesIgnoringSafeArea(.all)
                
                Text("January 5 2020")
                    .font(.custom("Arial", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -350)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -300)
                
                StockListView(stocks: filteredStocks)
                    .offset(y:100)
                
                GeometryReader { geometry in
                            BottomSheetView(
                                isOpen: self.$bottomSheetShown,
                                maxHeight: geometry.size.height * 0.7
                            ) {
                                NewsArticleView(newsArticles: self.stockListVM.news)
                            }
                        }.edgesIgnoringSafeArea(.all)
                    
                
            }
            
            
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

