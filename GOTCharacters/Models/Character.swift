//
//  Character.swift
//  GameOfThronesCharacters
//
//  Created by student on 18.05.25.
//

import Foundation
import SwiftData

@Model
final class Character: Comparable, Equatable {
    @Attribute(.unique) var id: Int
    var firstName: String?
    var lastName: String?
    var fullName: String
    var title: String?
    
    @Relationship var house: House? = nil
    
    var imageUrl: URL?
    
    init(id: Int, firstName: String, lastName: String, fullName: String, title: String, imageUrl: URL) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
        self.title = title
        self.imageUrl = imageUrl
    }
    
    static func < (lhs: Character, rhs: Character) -> Bool {
        return lhs.fullName < rhs.fullName
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
}

struct CharacterDTO: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var fullName: String
    var title: String
    var family: String
    var imageUrl: URL
}
