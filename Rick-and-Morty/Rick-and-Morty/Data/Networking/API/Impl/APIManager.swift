//
//  APIManager.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//

import Foundation

final class APIManager {
    
    static let shared = APIManager()
    
    internal let session = URLSession.shared
    
    init() { }
}

extension APIManager: CharacterAPIRepresentable {
    
    func fetchCharacters(page: String) async -> Result<[Character], Failure> {
        
        guard var urlComponents = URLComponents(string: "\(Constants.RICK_AND_MORTY_API.BASE_URL)/character")  else { return .failure(Failure.urlConstructError) }
        urlComponents.queryItems = [URLQueryItem(name: "page", value: page)]
        guard let url = urlComponents.url else { return .failure(Failure.urlConstructError) }
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
            
            return .success(characterResponse.results?.compactMap { $0.toCharacterObject() } ?? [])
            
        } catch {
            
            return .failure(Failure.decodingError)
        }
    }
    
    func fetchSingleCharacter(id: String) async -> Result<Character, Failure> {
        
        guard let url = URL(string: "\(Constants.RICK_AND_MORTY_API.BASE_URL)/character/\(id)") else { return .failure(Failure.urlConstructError) }
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            print(url)
            let character = try decoder.decode(CharacterDTO.self, from: data)
            
            return .success(character.toCharacterObject())
            
        } catch {
            
            return .failure(Failure.decodingError)
        }
    }
}
