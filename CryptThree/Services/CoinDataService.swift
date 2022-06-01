//
//  CoinDataService.swift
//  CryptThree
//
//  Created by adam janusewski on 5/29/22.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []  
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    // MARK: URL
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=false&price_change_percentage=24h") else { return }
        
        //  DOWNLOADING THE DATA
        coinSubscription = NetworkManager.download(url: url)
        // DECODING THE DATA
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}
