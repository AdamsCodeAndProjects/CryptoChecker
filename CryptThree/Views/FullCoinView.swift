//
//  FullCoinView.swift
//  CryptThree
//
//  Created by adam janusewski on 5/29/22.
//
//  MVVM - All Data on the Home Screen needs to be on its own view models

import SwiftUI

struct FullCoinView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        
        ZStack {
            VStack {
                
                HStack {
                    Text("Coin")
                    Spacer()
                    Text("Price")
                }
                .font(.caption)
                .foregroundColor(Color.gray)
                .padding(.horizontal)
                .padding(.vertical, 0)
                
                    List {
                        ForEach(vm.allCoins) { coin in
                            CoinView(coin: coin)
                                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                        }
                    }
                    
                .listStyle(PlainListStyle())
                
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 255)
            }
        }
    }
}

struct FullCoinView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FullCoinView()
        }
        .environmentObject(dev.homevm)
    }
}
