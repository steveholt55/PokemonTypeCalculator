//
//  SpriteImages.swift
//  PokeTypeCalculator
//
//  Created by Brandon Jenniges on 11/23/20.
//

import Foundation

struct SpriteImages: Codable {
    let backDefault: URL?
    let backFemale: URL?
    let backShiny: URL?
    let backShinyFemale: URL?
    let frontDefault: URL?
    let frontFemale: URL?
    let frontShiny: URL?
    let frontShinyFemale: URL?
    
    enum CodingKeys: String, CodingKey {
        case backDefault        = "back_default"
        case backFemale         = "back_female"
        case backShiny          = "back_shiny"
        case backShinyFemale    = "back_shiny_female"
        case frontDefault       = "front_default"
        case frontFemale        = "front_female"
        case frontShiny         = "front_shiny"
        case frontShinyFemale   = "front_shiny_female"
    }
}
