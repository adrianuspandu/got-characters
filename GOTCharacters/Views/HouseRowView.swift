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
            HStack(spacing: 28) {
                
                Image(house.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64)
                Text(house.nameString)
                    .font(.title.bold())
                    .foregroundStyle(.black)
                
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(Color("Secondary"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }

    }
}

#Preview {
    let house = House(name: .arryn, characters: [])
    HouseRowView(house: house)
}
