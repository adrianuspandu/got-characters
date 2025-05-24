//
//  PopularScrollView.swift
//  GOTCharacters
//
//  Created by student on 24.05.25.
//

import SwiftUI

struct PopularScrollView: View {
    var characters: [Character]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Popular")
                .font(.custom("Cinzel", size: 24).bold())
            
            ScrollView(.horizontal) {
                if !characters.isEmpty {
                    HStack {
                        CharacterCardView(character: characters.first(where: { $0.fullName == "Jon Snow"})!)
                        
                        CharacterCardView(character: characters.first(where: { $0.fullName == "Daenerys Targaryen"})!)
                        
                        CharacterCardView(character: characters.first(where: { $0.fullName == "Tywin Lannister"})!)
                        
                        CharacterCardView(character: characters.first(where: { $0.fullName == "Tyrion Lannister" })!)
                    }
                }
            }
        }
    }
}
