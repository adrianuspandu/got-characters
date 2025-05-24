//
//  CharactersGridView.swift
//  GOTCharacters
//
//  Created by student on 24.05.25.
//

import SwiftUI

struct CharactersGridView: View {
    var characters: [Character]
    let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 180)),
        GridItem(.adaptive(minimum: 150, maximum: 180))
      ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(characters) { character in
                CharacterCardView(character: character)
            }
        }
    }
}

#Preview {
    CharactersGridView(characters: [])
}
