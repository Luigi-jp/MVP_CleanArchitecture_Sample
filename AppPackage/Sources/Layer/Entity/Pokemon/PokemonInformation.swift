//
//  PokemonInformation.swift
//  
//
//  Created by Luigi Sato on 2023/06/28.
//

import Foundation

public struct PokemonInformation: Sendable {

    public let informations: [Information]

    public init(
        types: [String],
        height: Int,
        weight: Int,
        normalAbility: [String],
        hiddenAbility: [String]
    ) {
        var info = [Information]()
        info.append(.types(types))

        let mHeight = Float(height) / 10
        info.append(.height(mHeight))

        let kgWeight = Float(weight) / 10
        info.append(.weight(kgWeight))

        if normalAbility.count == 1 {
            info.append(.firstAbility(normalAbility[0]))
            info.append(.secondAbility(nil))
        } else if normalAbility.count > 1 {
            info.append(.firstAbility(normalAbility[0]))
            info.append(.secondAbility(normalAbility[1]))
        }

        info.append(.hiddenAbility(hiddenAbility.first))

        self.informations = info
    }

    public enum Information: Sendable, Hashable {
        case types([String])
        case height(Float)
        case weight(Float)
        case firstAbility(String)
        case secondAbility(String?)
        case hiddenAbility(String?)

        public var icon: String {
            switch self {
            case .types:
                return "seal"
            case .height:
                return "ruler"
            case .weight:
                return "barometer"
            case .firstAbility, .secondAbility:
                return "microbe"
            case .hiddenAbility:
                return "microbe.fill"
            }
        }

        public var name: String {
            switch self {
            case .types:
                return "Type"
            case .height:
                return "Height"
            case .weight:
                return "Weight"
            case .firstAbility:
                return "Ability 1"
            case .secondAbility:
                return "Ability 2"
            case .hiddenAbility:
                return "Hidden Ability"
            }
        }

        public var value: String {
            switch self {
            case let .types(types):
                return types.joined(separator: "/")
            case let .height(height):
                return "\(height) m"
            case let .weight(weight):
                return "\(weight) kg"
            case let .firstAbility(ability):
                return ability
            case let .secondAbility(ability),
                 let .hiddenAbility(ability):
                return ability ?? "None"
            }
        }
    }
}
