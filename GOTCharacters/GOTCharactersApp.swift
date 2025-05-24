//
//  GOTCharactersApp.swift
//  GOTCharacters
//
//  Created by student on 23.05.25.
//

import SwiftData
import SwiftUI

@main
struct GOTCharactersApp: App {    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [House.self, Character.self])
        }
    }
}
