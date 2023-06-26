//
//  PokemonDetailRequest.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import Foundation

struct PokemonDetailRequest: PokeApiRequestable {

    typealias Response = PokemonDetailResponse

    var path: String

    var queryItems: [URLQueryItem] {
        return []
    }

    init(id: Int) {
        self.path = "pokemon/\(id)"
    }
}
