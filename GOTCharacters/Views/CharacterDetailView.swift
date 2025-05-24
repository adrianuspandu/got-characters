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
            
            VStack {
                Image(character.house?.logo ?? "Westeros")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.2)
                    .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                    .opacity(0.4)
                    .clipped()
                
                Spacer()
            }
            
            VStack(spacing: 24) {
                Spacer().frame(height: 100)
                AsyncImage(url: character.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipped()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 200, height: 200, alignment: .center)
                }
                
                VStack(spacing: 24) {
                    Text(character.fullName)
                        .font(.custom("Cinzel", size: 40).bold())
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    
                    Text(character.title ?? "No Title")
                        .font(.custom("Cinzel", size: 20))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: 250, alignment: .center)
                
                Spacer()
                
                Text("House \(character.house?.nameString ?? "Unknown")")
                    .font(.custom("Cinzel", size: 20))
                
            }
        }
        .navigationTitle(character.fullName)
    }
}

#Preview {
    CharacterDetailView(character: Character(id: 0, firstName: "Daenerys", lastName: "Targaryen", fullName: "Daenerys Targaryen", title: "Mother Of Dragons", imageUrl: URL(string: "https://thronesapi.com/assets/images/daenerys.jpg") ?? URL(string: "https://thronesapi.com/assets/images/daenerys.jpg")!) )
}
