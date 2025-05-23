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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CharacterDetailView(character: Character(id: 0, firstName: "Daenerys", lastName: "Targaryen", fullName: "Daenerys Targaryen", title: "Mother Of Dragons", imageUrl: URL(string: "https://thronesapi.com/assets/images/daenerys.jpg") ?? URL(string: "https://thronesapi.com/assets/images/daenerys.jpg")!) )
}
