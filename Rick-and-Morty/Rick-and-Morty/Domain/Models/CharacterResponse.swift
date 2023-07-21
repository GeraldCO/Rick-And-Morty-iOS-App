//
//  CharacterResponse.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//

import Foundation

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct CharacterResponse: Codable {
    let info: Info?
    let results: [CharacterDTO]?
}

