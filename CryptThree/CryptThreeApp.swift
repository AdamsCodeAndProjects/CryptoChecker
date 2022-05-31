//
//  CryptThreeApp.swift
//  CryptThree
//
//  Created by adam janusewski on 5/27/22.
//

import SwiftUI

@main
struct CryptThreeApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
            .environmentObject(vm)  //  Now everything has access to this vm
        }
    }
}
