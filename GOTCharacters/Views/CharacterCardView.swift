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
        NavigationLink {
            CharacterDetailView(character: character)
        } label: {
            VStack(alignment: .leading, spacing: 12) {
                
                AsyncImage(url: character.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 120, alignment: .center)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: 160, height: 120, alignment: .center)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(character.fullName)
                        .font(.custom("Cinzel", size: 16).bold())
                        .foregroundStyle(.black)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                    Text(character.title ?? "No title")
                        .foregroundStyle(Color.black.opacity(0.6))
                        .font(.custom("Cinzel", size: 12))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(width: 160, height: 220, alignment: .top)
            .padding(.bottom, 16)
            .background(Color("Secondary"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }

        
    }
}

#Preview {
    CharacterCardView(character: Character(id: 0, firstName: "Daenerys", lastName: "Targaryen", fullName: "Daenerys Targaryen", title: "Mother Of Dragons", imageUrl: URL(string: "https://thronesapi.com/assets/images/daenerys.jpg") ?? URL(string: "https://thronesapi.com/assets/images/daenerys.jpg")!) )
}
