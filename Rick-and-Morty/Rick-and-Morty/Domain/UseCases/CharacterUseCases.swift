//
//  CharacterUseCases.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//

import Foundation

final class CharacterUseCases {
    
    /*
     Here u can change the data origin
     */
    private let api: RickAndMortyAPIs
    
    lazy var repository: RickAndMortyRepository = { RickAndMortyRepository(self.api) }()
    
    init(api: RickAndMortyAPIs = .RickAndMortyApi) {
        self.api = api
    }
    
    func getCharacters(page: String) async -> Result<[Character], Failure> {
        
        return await repository.getCharacters(page: page)
    }
    
    func getSingleCharacter(id: String) async -> Result<Character, Failure> {
        
        return await repository.getSingleCharacter(id: id)
    }
}
