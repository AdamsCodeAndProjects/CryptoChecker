//
//  MainView.swift
//  CryptThree
//
//  Created by adam janusewski on 5/28/22.
//

import SwiftUI

struct MainView: View {
    
    
    
    var body: some View {
        TabView {
            
            ContentView()
                .tabItem ({
                    Image(systemName: "house.fill")
                    Text("Home")
                })
            
            FullCoinView()
                .tabItem({
                   Image(systemName: "crown")
                    Text("Crypto")
                })
            
            TwitterView()
                .tabItem({
                   Image(systemName: "globe.americas.fill")
                    Text("Twitter")
                })
            
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
