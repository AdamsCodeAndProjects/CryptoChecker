//
//  StockVM.swift
//  CryptThree
//
//  Created by adam janusewski on 5/31/22.
//

import Foundation


import Foundation

struct StockVM {
    
    var coin: CoinModel
    
    var symbol: String {
        return self.coin.symbol.uppercased()
    }
    
    var name: String {
        return self.coin.name
    }
    
    var price: String {
        return String(format: "%.2f", self.coin.currentPrice)
    }
    
    var change: Double {
        return self.coin.priceChange!
    }
    
}
