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
                VStack(spacing: 8) {
                    HStack {
                        Button {
                            self.presenter?.didTapPopButton()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(.leading, 24)
                    LoadableImage(
                        url: pokemonDetail.imageUrl,
                        placeholder: ProgressView()
                            .frame(width: 150, height: 150)
                    )
                    .aspectRatio(1, contentMode: .fit)
                    .padding(.horizontal, 48.0)

                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("No.\(pokemonDetail.id)")
                                .font(.system(size: 16, weight: .bold))
                                .frame(height: 16)
                            Text(pokemonDetail.name)
                                .font(.system(size: 30, weight: .bold))
                                .frame(height: 32)
                        }
                        .padding(.leading, 16)

                        VStack(alignment: .trailing, spacing: 8) {
                            ForEach(pokemonDetail.information.informations, id: \.self) {
                                self.informationRow(icon: $0.icon, name: $0.name, value: $0.value)
                            }
                        }
                    }
                    Spacer()
                }
            } else {
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 245/255, green: 245/255, blue: 245/255))
        .navigationBarHidden(true)
        .onAppear {
            Task {
                await self.presenter?.onAppear()
            }
        }
    }
}

extension PokemonDetailScreenView {

    private func informationRow(icon: String, name: String, value: String) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(40)
            HStack(alignment: .center) {
                HStack(spacing: 26) {
                    Image(systemName: icon)
                    Text(name)
                        .font(.system(size: 15, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Text(value)
                    .font(.system(size: 15, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.leading, 28)
            .padding(.trailing, 40)
        }
        .frame(height: 48)
    }
}

struct PokemonDetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailScreenView(presenter: nil, viewData: .init(number: 1))
    }
}
