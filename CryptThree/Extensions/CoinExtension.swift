//
//  CoinExtension.swift
//  CryptThree
//
//  Created by adam janusewski on 5/28/22.
//

import Foundation
import SwiftUI

// Only for preview

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() {}
    
    let homevm = HomeViewModel()
        
        let coin = CoinModel(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            currentPrice: 28234,
            priceChange: 0.8655489754
            )
}
