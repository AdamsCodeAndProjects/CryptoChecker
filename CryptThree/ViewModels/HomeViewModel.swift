//
//  HomeViewModel.swift
//  CryptThree
//
//  Created by adam janusewski on 5/29/22.
//


import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchTerm: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
//    func load() {
//        fetchStocks()
//    }
//
//    private func fetchStocks() {
//        CoinDataService().getCoins { coins in
//            if let coins = coins {
//                DispatchQueue.main.async {
//                    self.coins = coins.map(StockVM.init)
//                }
//            }
//        }
//    }
}
