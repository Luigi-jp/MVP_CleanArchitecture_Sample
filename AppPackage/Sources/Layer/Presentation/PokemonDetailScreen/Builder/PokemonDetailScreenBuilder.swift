//
//  PokemonDetailScreenBuilder.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import SwiftUI

public enum PokemonDetailScreenBuilder {

    public static func build(id: Int) -> UIViewController {
        let viewData = PokemonDetailViewData(id: id)
        let router = PokemonDetailRouterImpl()
        let presenter = PokemonDetailPresenter(viewData: viewData, router: router)
        let screen = PokemonDetailScreenView(presenter: presenter, viewData: viewData)
        let vc = UIHostingController(rootView: screen)
        router.hostingController = vc
        return vc
    }
}