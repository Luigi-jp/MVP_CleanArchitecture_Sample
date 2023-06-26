//
//  PokemonDetailScreenView.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import SwiftUI
import SharedPresentation

struct PokemonDetailScreenView: View {

    var presenter: (any PokemonDetailPresenterInput)?
    @ObservedObject var viewData: PokemonDetailViewData

    var body: some View {
        VStack {
            if let pokemonDetail = self.viewData.pokemonDetail {
                HStack(alignment: .center, spacing: 40) {
                    LoadableImage(
                        url: self.viewData.pokemonDetail?.imageUrl,
                        placeholder: ProgressView()
                    )
                    .frame(width: 160, height: 160, alignment: .center)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("No.\(pokemonDetail.id)")
                        Text(pokemonDetail.name)
                    }
                    .font(.title2)
                }
                List {
                    HStack {
                        Text("タイプ：")
                        Spacer()
                        Text("くさ　どく")
                    }

                    HStack {
                        Text("特性：")
                        Spacer()
                        Text("しんりょく")
                    }
                }
                Spacer()
            } else {
                ProgressView()
            }

        }
        .navigationTitle("Bulbasaur")
        .onAppear {
            Task {
                await self.presenter?.onAppear()
            }
        }
    }
}

struct PokemonDetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailScreenView(presenter: nil, viewData: .init(id: 1))
    }
}
