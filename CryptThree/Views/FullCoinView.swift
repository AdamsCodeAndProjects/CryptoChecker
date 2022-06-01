//
//  FullCoinView.swift
//  CryptThree
//
//  Created by adam janusewski on 5/29/22.
//

import SwiftUI

struct FullCoinView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        
        ZStack {
            
            VStack {
                HStack {
                    Text(getDate())
                        .fontWeight(.bold)
                        .offset(y: -80)
                        .font(.custom("Arial", size: 25))
                        .foregroundColor(Color.gray)
                        .padding(.leading, 20)
                        .padding(.bottom, 0)
                    
                    Spacer()
                }
                
                SearchView(searchTerm: self.$vm.searchTerm)
                    .offset(y: -70)
                Spacer()
                
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
                    .frame(width: 200, height: 25)
                
//                    .navigationBarTitle(getDate())
            }
        }
    }
    
    func getDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
//        let month = calendar.component(.month, from: date)
        let names = Calendar.current.monthSymbols
        let month = Calendar.current.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let theDate = ("\(names[month - 1]) \(day), \(year)")
        return theDate
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
