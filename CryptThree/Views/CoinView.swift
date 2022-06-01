//
//  CoinView.swift
//  CryptThree
//
//  Created by adam janusewski on 5/28/22.
//

import SwiftUI

struct CoinView: View {
    
    let coin: CoinModel
    
    var body: some View {
        HStack(spacing: 0) {
            
            // Left Side
            Text(coin.name)
                .padding(.leading, 10)
            
            Spacer()
            
                .frame(width: 30, height: 30)
            Text("(\(coin.symbol))".uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.black)
            Spacer()
            
            //  Right side
            VStack(alignment: .trailing) {
                // Current Price 
                Text(coin.currentPrice.asCurrencywithSixDecimals())
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Text(coin.priceChange?.asPercentString() ?? "")
                    .foregroundColor((coin.priceChange ?? 0) >= 0 ?
                Color.green : Color.red)
            }
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(coin: dev.coin)
            .previewLayout(.sizeThatFits)
    }
}
