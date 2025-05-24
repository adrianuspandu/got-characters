//
//  ContentView.swift
//  GameOfThronesCharacters
//
//  Created by student on 18.05.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Character.fullName) var characters: [Character]
    @Query var houses: [House]
    
    @State private var houseMap: [HouseName: House] = [:]
    @State private var searchText: String = ""
    
    var searchResults: [Character] {
        return characters.filter { $0.fullName.contains(searchText)}
    }
    
    var body: some View {
        
        NavigationStack {
            // MARK: Header View
            HomeHeaderView(searchText: $searchText)
            
            // MARK: Search Results View
            if !searchText.isEmpty {
                if !searchResults.isEmpty {
                    
                    // MARK: Search Results View
                    VStack(alignment: .leading) {
                        Text("Search Results")
                            .font(.custom("Cinzel", size: 24).bold())
                        ScrollView {
                            CharactersGridView(characters: searchResults)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                } else {
                    
                    // MARK: No Search Results
                    Text("No Search Results")
                        .frame(maxHeight: .infinity)
                    
                }
                
            } else {
                
                // MARK: HomeScrollView
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // MARK: Popular Horizontal Scroll View
                        PopularScrollView(characters: characters)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Houses")
                                .font(.custom("Cinzel", size: 24).bold())
                            
                            VStack(spacing: 20) {
                                ForEach(houses, id: \.self) { house in
                                    HouseRowView(house: house)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 20)
            }
            
        }
        .task {
            await bootstrapCharactersAndHouses()
        }
    }
    
    func bootstrapCharactersAndHouses() async {
        // Bootstrap Houses
        if houses.isEmpty {
            for house in HouseName.allCases {
                let newHouse = House(name: house, characters: [])
                modelContext.insert(newHouse)
                houseMap[house] = newHouse
            }
        }
        
        // Bootstrap Characters
        if characters.isEmpty {
            guard let url = URL(string: "https://thronesapi.com/api/v2/characters") else { return }
            
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    print("HTTP error")
                    return
                }
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                }
                
                if let decodedData = try? JSONDecoder().decode([CharacterDTO].self, from: data) {
                    
                    for character in decodedData {
                        let newCharacter = Character(
                            id: character.id,
                            firstName: character.firstName,
                            lastName: character.lastName,
                            fullName: character.fullName,
                            title: character.title,
                            imageUrl: character.imageUrl)
                        
                        modelContext.insert(newCharacter)
                        
                        
                        if let key = HouseName(familyString: character.family),
                           let house = houseMap[key] {
                            newCharacter.house = house
                            house.characters.append(newCharacter)
                        } else if let others = houseMap[.others] {
                            newCharacter.house = others
                            others.characters.append(newCharacter)
                        }
                    }
                    
                    
                    try modelContext.save()
                }
            } catch {
                print("Error while bootstrapping Characters: \(error.localizedDescription)")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
