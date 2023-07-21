//
//  RickAndMortyRepository.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//

import Foundation

enum RickAndMortyAPIs {
    case RickAndMortyMockApi
    case RickAndMortyApi
    
    var implementationClass: any APIRepresentable  {
        switch self {
        case .RickAndMortyMockApi: return MockAPIManager.shared
        case .RickAndMortyApi: return APIManager.shared
        }
    }
}

final class RickAndMortyRepository {
    
    internal var _api: RickAndMortyAPIs
    
    init(_ api: RickAndMortyAPIs = .RickAndMortyApi) {
         self._api = api
    }
}

extension RickAndMortyRepository: CharacterRepositoryRepresentable {
    
    var api:  CharacterAPIRepresentable {
        _api.implementationClass as! CharacterAPIRepresentable
    }
    
    func getCharacters(page: String) async -> Result<[Character], Failure> {
        
        return await api.fetchCharacters(page: page)
    }
    
    func getSingleCharacter(id: String) async -> Result<Character, Failure> {
        
        return await api.fetchSingleCharacter(id: id)
    }
}
