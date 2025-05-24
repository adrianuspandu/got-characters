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
            return "Perched in the impregnable Eyrie, the Arryns live “As High as Honor,” with a white falcon sigil on blue. Isolated by mountains, they uphold strict codes of purity and conduct, often at the cost of political naiveté."
        case .baratheon:
            return "House Baratheon of Storm’s End rose to power under Robert’s Rebellion and bears the crowned stag sigil as rulers of the Seven Kingdoms. Despite Robert’s charismatic reign, internal splits and rival branches threaten their throne."
        case .greyjoy:
            return "The Greyjoys of the Iron Islands live by “We Do Not Sow,” plundering by sea under their golden kraken banner. Proud and fiercely independent, they chafe under mainland rule yet are often fractured by rebellions."
        case .lannister:
            return "The Lannisters of Casterly Rock wield immense wealth from their gold mines and live by the saying “A Lannister always pays his debts.” Their golden lion sigil reflects both their pride and the ruthless politicking that pervades their family."
        case .martell:
            return "Dornish rulers at Sunspear, the Martells live by “Unbowed, Unbent, Unbroken,” reflecting their desert-forged resilience and gender-equal customs. Their red sun-and-spear sigil hints at both their hospitality and their hidden ferocity."
        case .stark:
            return "The Starks of Winterfell are the noble rulers of the North, famed for their unbreakable honor and the motto “Winter Is Coming.” Their grey direwolf sigil and fierce loyalty symbolize resilience forged in the harsh northern climate."
        case .targaryen:
            return "Once conquerors of all Westeros, the Targaryens are dragonlords in exile, defined by their red three-headed dragon sigil and silver-gold hair. Though overthrown, surviving heirs carry an indomitable claim to the Iron Throne."
        case .tully:
            return "The Tullys of Riverrun rule the Riverlands with the motto “Family, Duty, Honor” and a leaping trout sigil. Strategically caught between warring neighbors, they balance peacemaking with the harsh realities of conflict."
        case .tyrell:
            return "House Tyrell of Highgarden controls the fertile Reach, symbolized by a golden rose and the words “Growing Strong.” Masters of courtly intrigue, they weave alliances through marriages to extend their influence."
        case .others:
            return "Characters who serve no Great House include Free Folk, smallfolk, maesters, knights of minor holds and sellswords. Unbound by grand sigils, their varied backgrounds and personal quests often tip the balance in unexpected ways."
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
