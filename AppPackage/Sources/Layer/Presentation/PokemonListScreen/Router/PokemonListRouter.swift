//
//  File.swift
//  
//
//  Created by ykkd on 2023/06/15.
//

import PresentationDependencies
import PokemonDetailScreen
import SharedPresentation
import SwiftUI

public protocol PokemonListRouter: Router {

//    func pushPokemonList()
    func pushPokemonDetail(number: Int)
}

final class PokemonListRouterImpl: PokemonListRouter {

    weak var hostingController: UIHostingController<PokemonListScreenView>?

    // 遷移例。一画面しか実装してないので自分の画面から再度自分をpushしてるけど、本来ならここが他画面になる想定
//    func pushPokemonList() {
//        self.hostingController?.navigationController?.pushViewController(
//            InjectedValues[\.pokemonListScreen](),
//            animated: true
//        )
//    }

    func pushPokemonDetail(number: Int) {
        InjectedValues[\.pokemonDetailScreen] = { PokemonDetailScreenBuilder.build(number: number) }
        self.hostingController?.navigationController?.pushViewController(
            InjectedValues[\.pokemonDetailScreen](),
            animated: true
        )
    }
}
