//
//  ContentView.swift
//  CryptThree
//
//  Created by adam janusewski on 5/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pulsateAnimation: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Crypto Checker")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .underline()
                    .padding()
                
                Spacer()
                
//                NavigationLink(destination: FullCoinView()) {
                    
                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaleEffect(self.pulsateAnimation ? 1.2 : 0.9)
                        .animation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsateAnimation)
                        .foregroundColor(Color.green)
//                }
                Spacer()
            }
            .onAppear(
                perform: {
                    self.pulsateAnimation.toggle()
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
