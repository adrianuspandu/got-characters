//
//  House.swift
//  GameOfThronesCharacters
//
//  Created by student on 21.05.25.
//

import Foundation
import SwiftData

enum HouseName: String, CaseIterable, Codable {
    case arryn
    case baratheon
    case greyjoy
    case lannister
    case martell
    case stark
    case targaryen
    case tully
    case tyrell
    case others
    
    var logo: String {
        switch self {
        case .arryn:
            return "Arryn"
        case .baratheon:
            return "Baratheon"
        case .greyjoy:
            return "Greyjoy"
        case .lannister:
            return "Lannister"
        case .martell:
            return "Martell"
        case .stark:
            return "Stark"
        case .targaryen:
            return "Targaryen"
        case .tully:
            return "Tully"
        case .tyrell:
            return "Tyrell"
        case .others:
            return "Westeros"
        }
    }
    
    var desc: String {
        switch self {
        case .arryn:
            return "The Arryn family is a prominent noble family in Westeros, known for their loyalty, cunning, and strategic prowess."
        case .baratheon:
            return "The Baratheon family is a prominent noble family in Westeros, known for their wealth, power, and long line of succession."
        case .greyjoy:
            return "The Greyjoy family is a prominent noble family in Westeros, known for their isolation, cunning, and long line of succession."
        case .lannister:
            return "The Lannister family is a prominent noble family in Westeros, known for their wealth, power, and long line of succession."
        case .martell:
            return "The Martell family is a prominent noble family in Westeros, known for their cunning, strategic prowess, and long line of succession."
        case .stark:
            return "The Stark family is a prominent noble family in Westeros, known for their loyalty, cunning, and strategic prowess."
        case .targaryen:
            return "The Targaryen family is a prominent noble family in Westeros, known for their dragons, power, and long line of succession."
        case .tully:
            return "The Tully family is a prominent noble family in Westeros, known for their loyalty, cunning, and strategic prowess."
        case .tyrell:
            return "The Tyrell family is a prominent noble family in Westeros, known for their wealth, power, and long line of succession."
        case .others:
            return "Unknown"
        }
    }
}

@Model
final class House: Comparable {
    var name: HouseName
    var nameString: String {
        name.rawValue.capitalized
    }
    var logo: String
    var desc: String
    
    @Relationship(inverse: \Character.house) var characters: [Character]
    
    init(name: HouseName, characters: [Character]) {
        self.name = name
        self.logo = name.logo
        self.desc = name.desc
        self.characters = characters
    }
    
    static func < (lhs: House, rhs: House) -> Bool {
        lhs.nameString < rhs.nameString
    }
}

extension HouseName {
  init?(familyString: String) {
    let raw = familyString
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .lowercased()
      .replacingOccurrences(of: "house ", with: "")
    self.init(rawValue: raw)
  }
}
