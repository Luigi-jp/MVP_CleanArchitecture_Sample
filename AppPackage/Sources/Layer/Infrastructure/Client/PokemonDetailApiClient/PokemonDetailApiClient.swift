//
//  PokemonDetailApiClient.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/25.
//

import ApiWrapper
import Entity
import InfrastructureInterface
import Foundation

public struct PokemonDetailApiClient: PokemonDetailApiRepository {

    public init() {}

    public func get(_ id: Int) async throws -> PokemonDetail {
        do {
            let result = try await ApiWrapper.request(PokemonDetailRequest(id: id))
            let information = PokemonInformation(
                types: result.response.types.map { $0.type.name },
                height: result.response.height,
                weight: result.response.weight,
                normalAbility: result.response.abilities.filter { !$0.isHidden }.map { $0.ability.name },
                hiddenAbility: result.response.abilities.filter { $0.isHidden }.map { $0.ability.name }
            )
            let pokemonDetail = PokemonDetail(
                id: result.response.id,
                name: result.response.name,
                information: information
            )
            return pokemonDetail
        } catch {
            if error is ApiError {
                throw InfrastructureError.api(error as! ApiError)
            } else {
                throw InfrastructureError.unknown(error)
            }
        }
    }
}
