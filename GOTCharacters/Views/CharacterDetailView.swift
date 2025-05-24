//
//  CharacterDetailView.swift
//  GOTCharacters
//
//  Created by student on 23.05.25.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    
    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea(edges: .bottom)
            
            Image(character.house?.logo ?? "Westeros")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300, alignment: .center)
                .opacity(0.05)
            
            VStack(spacing: 24) {
                AsyncImage(url: character.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipped()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 150, height: 150, alignment: .center)
                }
                
                VStack(spacing: 16) {
                    Text(character.fullName)
                    
                    Text(character.title ?? "No Title")
                        .font(.callout)
                }
                
                Text("House \(character.house?.nameString ?? "Unknown")")
            }
        }
        .navigationTitle(character.fullName)
    }
}

#Preview {
    CharacterDetailView(character: Character(id: 0, firstName: "Daenerys", lastName: "Targaryen", fullName: "Daenerys Targaryen", title: "Mother Of Dragons", imageUrl: URL(string: "https://thronesapi.com/assets/images/daenerys.jpg") ?? URL(string: "https://thronesapi.com/assets/images/daenerys.jpg")!) )
}
