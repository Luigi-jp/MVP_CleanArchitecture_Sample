//
//  GetPokemonDetailUseCase.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/25.
//

import Entity
import Foundation

public protocol GetPokemonDetailUseCase {
    func execute(_ id: Int) async throws -> PokemonDetail
}
