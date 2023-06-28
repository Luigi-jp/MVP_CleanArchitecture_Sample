//
//  PokemonDetailResponse.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import Foundation

struct PokemonDetailResponse: Decodable {

    let abilities: [PokemonAbility]

    let height: Int

    let id: Int

    let name: String

    let types: [PokemonType]

    let weight: Int
}

extension PokemonDetailResponse {

    struct PokemonAbility: Decodable {

        let ability: Ability

        let isHidden: Bool

        let slot: Int
    }
}

extension PokemonDetailResponse.PokemonAbility {

    struct Ability: Decodable {

        let name: String

        let url: String
    }
}

extension PokemonDetailResponse {

    struct PokemonType: Decodable {

        let slot: Int

        let type: `Type`
    }
}

extension PokemonDetailResponse.PokemonType {

    struct `Type`: Decodable {

        let name: String

        let url: String
    }
}

