//
//  HouseDetailView.swift
//  GameOfThronesCharacters
//
//  Created by student on 23.05.25.
//

import SwiftUI

struct HouseDetailView: View {
    var house: House
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 32) {
                HouseHeaderView(house: house)
                
                VStack(alignment: .leading) {
                    Text("Characters")
                        .font(.custom("Cinzel", size: 24).bold())
                    
                    CharactersGridView(characters: house.characters)
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


