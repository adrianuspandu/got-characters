//
//  HouseDetailView.swift
//  GameOfThronesCharacters
//
//  Created by student on 23.05.25.
//

import SwiftUI

struct HouseDetailView: View {
    var house: House
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
      ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                HouseHeaderView(house: house)
                
                VStack(alignment: .leading) {
                    Text("Characters")
                        .font(.title.bold())
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(house.characters) { character in
                            CharacterCardView(character: character)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(house.nameString)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HouseDetailView(house: House(name: .arryn, characters: []))
}


