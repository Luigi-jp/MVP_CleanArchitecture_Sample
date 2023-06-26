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
            let pokemonDetail = PokemonDetail(
                id: result.response.id,
                name: result.response.name,
                height: result.response.height,
                weight: result.response.weight
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
