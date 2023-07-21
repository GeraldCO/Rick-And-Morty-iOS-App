//
//  APIRepresentable.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//

import Foundation

protocol APIRepresentable {

    var session: URLSession { get }
}

protocol CharacterAPIRepresentable: AnyObject, APIRepresentable {
    
    func fetchCharacters(page: String) async -> Result<[Character], Failure>
    
    func fetchSingleCharacter(id: String) async -> Result<Character, Failure>
}
