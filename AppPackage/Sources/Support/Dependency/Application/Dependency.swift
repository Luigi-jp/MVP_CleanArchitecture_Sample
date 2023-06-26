//
//  File.swift
//  
//
//  Created by ykkd on 2023/06/14.
//

import Application
@_exported import ApplicationInterface
@_exported import Dependency

// MARK: - AppEnvironmentProviderKey
struct GetPokemonListUseCaseProviderKey: InjectionKey {

    static var currentValue: any GetPokemonListUseCase = GetPokemonListInteractor()
}

struct GetPokemonDetailUseCaseProviderKey: InjectionKey {

    static var currentValue: any GetPokemonDetailUseCase = GetPokemonDetailInteractor()
}

extension InjectedValues {

    public var getPokemonListUseCase: any GetPokemonListUseCase {
        get { Self[GetPokemonListUseCaseProviderKey.self] }
        set { Self[GetPokemonListUseCaseProviderKey.self] = newValue }
    }

    public var getPokemonDetailUseCase: any GetPokemonDetailUseCase {
        get { Self[GetPokemonDetailUseCaseProviderKey.self] }
        set { Self[GetPokemonDetailUseCaseProviderKey.self] = newValue }
    }
}
