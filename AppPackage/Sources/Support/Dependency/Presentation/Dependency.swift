//
//  Dependency.swift
//  
//
//  Created by ykkd on 2023/06/16.
//

import UIKit
@_exported import Dependency

// MARK: - AppEnvironmentProviderKey
struct PokemonListScreenProviderKey: InjectionKey {

    static var currentValue: () -> UIViewController = { UIViewController() }
}

extension InjectedValues {

    public var pokemonListScreen: () -> UIViewController {
        get { Self[PokemonListScreenProviderKey.self] }
        set { Self[PokemonListScreenProviderKey.self] = newValue }
    }
}

struct PokemonDetailScreenProviderKey: InjectionKey {

    static var currentValue: () -> UIViewController = { UIViewController() }
}

extension InjectedValues {

    public var pokemonDetailScreen: () -> UIViewController {
        get { Self[PokemonDetailScreenProviderKey.self] }
        set { Self[PokemonDetailScreenProviderKey.self] = newValue }
    }
}
