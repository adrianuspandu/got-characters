//
//  HouseRowView.swift
//  GameOfThronesCharacters
//
//  Created by student on 23.05.25.
//

import SwiftUI

struct HouseRowView: View {
    var house: House
    var body: some View {
        NavigationLink {
            HouseDetailView(house: house)
        } label: {
            HStack {
                Image(house.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64)
                Text(house.nameString)
                    .font(.custom("Arial", size: 18))
            }
        }

    }
}

#Preview {
    let house = House(name: .arryn, characters: [])
    HouseRowView(house: house)
}
