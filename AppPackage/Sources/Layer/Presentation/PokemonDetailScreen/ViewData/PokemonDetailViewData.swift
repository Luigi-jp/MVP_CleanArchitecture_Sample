//
//  PokemonDetailViewData.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import Entity
import SharedPresentation
import Foundation

public actor PokemonDetailViewData: ObservableObject {

    @MainActor @Published private(set) var title: String = ""
    @MainActor @Published private(set) var isLoading: Bool = false
    @MainActor @Published private(set) var pokemonDetail: PokemonDetail?
    @MainActor @Published private(set) var error: PresentationError?
    @MainActor @Published private(set) var isErrorShown = false

    @MainActor private(set) var number: Int

    public init(number: Int) {
        self.number = number
    }

    func updateTitle(title: String) async {
        await MainActor.run {
            self.title = title
        }
    }

    func updateIsLoading(isLoading: Bool) async {
        await MainActor.run {
            self.isLoading = isLoading
        }
    }

    func updateIsErrorShown(isErrorShown: Bool) async {
        await MainActor.run {
            self.isErrorShown = isErrorShown
        }
    }

    func updatePokemonDetail(pokemonDetail: PokemonDetail) async {
        await MainActor.run {
            self.pokemonDetail = pokemonDetail
        }
    }

    func updateError(_ error: PresentationError?) async {
        await MainActor.run {
            self.error = error
        }
    }
}
