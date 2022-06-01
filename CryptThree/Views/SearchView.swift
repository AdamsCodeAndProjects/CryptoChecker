//
//  SearchView.swift
//  CryptThree
//
//  Created by adam janusewski on 5/31/22.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: self.$searchTerm)
                .foregroundColor(Color.gray)
                .padding()
            
            Spacer()
        }.foregroundColor(Color.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
