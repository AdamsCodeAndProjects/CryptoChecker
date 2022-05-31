//
//  CoinDataService.swift
//  CryptThree
//
//  Created by adam janusewski on 5/29/22.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []  // This now becomes a publisher, and can have subscribers.  all subscribers will receive this data
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    // MARK: URL
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=false&price_change_percentage=24h") else { return }
        
        //  DOWNLOADING THE DATA
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                // CHECKING THAT IT IS VALID DATA
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
        // DECODING THE DATA
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
                // TAKING THE DATA AND APPENDING TO ARRAY
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            }
    }
}
