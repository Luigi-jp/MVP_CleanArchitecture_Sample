//
//  PokemonDetailRouter.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import SharedPresentation
import SwiftUI

public protocol PokemonDetailRouter: Router {

}

final class PokemonDetailRouterImpl: PokemonDetailRouter {

    weak var hostingController: UIHostingController<PokemonDetailScreenView>?
}
