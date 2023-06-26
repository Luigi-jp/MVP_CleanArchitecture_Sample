//
//  PokemonDetailApiRepository.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import Entity

public protocol PokemonDetailApiRepository {
    func get(_ id: Int) async throws -> PokemonDetail
}
