//
//  Model.swift
//  Breaking Bad character explorer app
//
//  Created by Emil Vaklinov on 31/07/2020.
//  Copyright © 2020 Emil Vaklinov. All rights reserved.
//

import Foundation

// MARK: - CharacterElement
struct Character {
    let charID: Int
    let name, birthday: String
    let occupation: [String]
    let img: String
    let status, nickname: String
    let appearance: [Int]
    let portrayed, category: String
    let betterCallSaulAppearance: [Any?]

    enum CodingKeys: String, CodingKey {
        case charID
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
        case betterCallSaulAppearance
    }
}
