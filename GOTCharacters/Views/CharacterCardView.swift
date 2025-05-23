//
//  CharacterCardView.swift
//  GOTCharacters
//
//  Created by student on 23.05.25.
//

import SwiftUI

struct CharacterCardView: View {
    var character: Character
    var body: some View {
        VStack(spacing: 12) {
            AsyncImage(url: character.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 86, height: 86)
            .clipShape(Circle())

            
            VStack(alignment: .leading, spacing: 8) {
                Text(character.fullName)
                    .font(.title2.bold())
                Text(character.title ?? "No title")
            }
            .frame(width: .infinity)
        }
        .frame(maxWidth: 150)
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color("Secondary"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    CharacterCardView(character: Character(id: 0, firstName: "Daenerys", lastName: "Targaryen", fullName: "Daenerys Targaryen", title: "Mother Of Dragons", imageUrl: URL(string: "https://thronesapi.com/assets/images/daenerys.jpg") ?? URL(string: "https://thronesapi.com/assets/images/daenerys.jpg")!) )
}
