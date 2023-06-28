//
//  File.swift
//  
//
//  Created by ykkd on 2023/06/14.
//

import Infrastructure
@_exported import InfrastructureInterface
@_exported import Dependency

// MARK: - AppEnvironmentProviderKey
struct PokemonListApiRepositoryProviderKey: InjectionKey {

    static var currentValue: any PokemonListApiRepository = PokemonListApiClient()
}

struct PokemonDetailApiRepositoryProviderKey: InjectionKey {

    static var currentValue: any PokemonDetailApiRepository = PokemonDetailApiClient()
}

extension InjectedValues {

    public var pokemonListApiRepository: any PokemonListApiRepository {
        get { Self[PokemonListApiRepositoryProviderKey.self] }
        set { Self[PokemonListApiRepositoryProviderKey.self] = newValue }
    }

    public var pokemonDetailApiRepository: any PokemonDetailApiRepository {
        get { Self[PokemonDetailApiRepositoryProviderKey.self] }
        set { Self[PokemonDetailApiRepositoryProviderKey.self] = newValue }
    }
}
