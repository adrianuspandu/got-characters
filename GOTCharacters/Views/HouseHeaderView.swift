//
//  HouseHeaderView.swift
//  GOTCharacters
//
//  Created by student on 23.05.25.
//

import SwiftUI

struct HouseHeaderView: View {
    var house: House
    
    var body: some View {
        HStack(spacing: 24) {
            Image(house.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 78)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("House \(house.nameString)")
                    .font(.title)
                
                Text(house.desc)
            }
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.accentColor)
    }
}

#Preview {
    HouseHeaderView(house: House(name: .arryn, characters: []))
}
