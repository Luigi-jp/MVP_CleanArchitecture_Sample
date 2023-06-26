//
//  PokemonDetail.swift
//  
//
//  Created by 佐藤瑠偉史 on 2023/06/24.
//

import Foundation

public struct PokemonDetail: Sendable {

    public let id: Int
    public let name: String
    public let imageUrl: URL?
    public let height: Int
    public let weight: Int

    // Question: ここでResponseを渡さないのはEntityがInfra層に依存しないようにするため？
    public init(
        id: Int,
        name: String,
        height: Int,
        weight: Int
    ) {
        self.id = id
        self.name = name
        self.imageUrl = PokemonImageURLGenerator.generateThumbnailURL(from: id)
        self.height = height
        self.weight = weight
    }
}