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
    let other: SpriteImagesOther?
    
    var officialArtImageURL: URL? {
        self.other?.officialArtwork?.defaultImage
    }
    
    enum CodingKeys: String, CodingKey {
        case backDefault        = "back_default"
        case backFemale         = "back_female"
        case backShiny          = "back_shiny"
        case backShinyFemale    = "back_shiny_female"
        case frontDefault       = "front_default"
        case frontFemale        = "front_female"
        case frontShiny         = "front_shiny"
        case frontShinyFemale   = "front_shiny_female"
        case other              = "other"
    }
}

struct SpriteImagesOther: Codable {
    let dreamworld: SpriteImagesAltSet?
    let officialArtwork: SpriteImagesAltSet?
    
    enum CodingKeys: String, CodingKey {
        case dreamworld         = "dream_world"
        case officialArtwork    = "official-artwork"
    }
}

struct SpriteImagesAltSet: Codable {
    let backDefault: URL?
    let backFemale: URL?
    let backShiny: URL?
    let backShinyFemale: URL?
    let frontDefault: URL?
    let frontFemale: URL?
    let frontShiny: URL?
    let frontShinyFemale: URL?
    
    var defaultImage: URL? {
        return frontDefault ?? frontFemale ?? frontShiny ?? frontShinyFemale
    }
    
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

extension SpriteImages {
    static func mock() -> SpriteImages {
        SpriteImages(backDefault: nil, backFemale: nil, backShiny: nil, backShinyFemale: nil, frontDefault: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/667.png"), frontFemale: nil, frontShiny: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/667.png"), frontShinyFemale: nil, other: SpriteImagesOther.mock())
    }
}

extension SpriteImagesOther {
    static func mock() -> SpriteImagesOther {
        SpriteImagesOther(dreamworld: SpriteImagesAltSet.mock(), officialArtwork: SpriteImagesAltSet.mock())
    }
}

extension SpriteImagesAltSet {
    static func mock() -> SpriteImagesAltSet {
        SpriteImagesAltSet(backDefault: nil, backFemale: nil, backShiny: nil, backShinyFemale: nil, frontDefault: nil, frontFemale: nil, frontShiny: nil, frontShinyFemale: nil)
    }
}



