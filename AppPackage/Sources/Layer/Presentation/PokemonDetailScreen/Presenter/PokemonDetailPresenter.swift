//
//  PokemonDetailPresenter.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import ApplicationDependencies
import Foundation
import SharedPresentation

public protocol PokemonDetailPresenterInput {
    var viewData: PokemonDetailViewData { get }
    func onAppear() async
    func performRequest() async
    func updateError(_ error: PresentationError?) async
}

public final class PokemonDetailPresenter: PokemonDetailPresenterInput {

    public let viewData: PokemonDetailViewData

    let router: any PokemonDetailRouter

    @Injected(\.getPokemonDetailUseCase)
    var getPokemonDetailUseCase: any GetPokemonDetailUseCase

    public init(viewData: PokemonDetailViewData, router: any PokemonDetailRouter) {
        self.viewData = viewData
        self.router = router
    }

    public func onAppear() async {
        await self.performRequest()
    }

    public func performRequest() async {
        await self.viewData.updateIsLoading(isLoading: true)
        do {
            let pokemonDetail = try await self.getPokemonDetailUseCase.execute(self.viewData.number)
            await self.viewData.updatePokemonDetail(pokemonDetail: pokemonDetail)
        } catch {
            print("e: \(error)")
        }
        await self.viewData.updateIsLoading(isLoading: false)
    }

    public func updateError(_ error: SharedPresentation.PresentationError?) async {
        await self.viewData.updateError(error)
    }
}
