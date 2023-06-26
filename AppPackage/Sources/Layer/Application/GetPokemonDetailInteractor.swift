//
//  GetPokemonDetailInteractor.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/25.
//

import ApplicationInterface
import Entity
import Foundation
import InfrastructureDependencies

public struct GetPokemonDetailInteractor: GetPokemonDetailUseCase {

    @Injected(\.pokemonDetailApiRepository)
    private var repository: any PokemonDetailApiRepository

    public init() {}

    public func execute(_ id: Int) async throws -> PokemonDetail {
        do {
            return try await repository.get(id)
        } catch {
            throw ApplicationError(error)
        }
    }
}
