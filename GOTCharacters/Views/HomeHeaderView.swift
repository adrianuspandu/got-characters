//
//  HomeHeaderView.swift
//  GOTCharacters
//
//  Created by student on 24.05.25.
//

import SwiftUI

struct HomeHeaderView: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack(spacing: 24) {
            // MARK: App Logo
            Image("Header")
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 70)
            
            // MARK: Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search a character", text: $searchText)
                    .font(.custom("Cinzel", size: 16))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}

#Preview {
    HomeHeaderView(searchText: .constant(""))
}
