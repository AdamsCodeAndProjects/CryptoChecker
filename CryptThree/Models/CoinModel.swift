//
//  CoinModel.swift
//  CryptThree
//
//  Created by adam janusewski on 5/27/22.
//

import Foundation

/*
URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=false&price_change_percentage=24h
 JSON Response
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "current_price": 28732,
     "market_cap": 547222911338,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 603197103592,
     "total_volume": 30649416646,
     "high_24h": 29327,
     "low_24h": 28327,
   },
*/

struct CoinModel: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let currentPrice: Double
    let priceChange: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case currentPrice = "current_price"
        case priceChange = "price_change_percentage_24h_in_currency"
    }
    
}
