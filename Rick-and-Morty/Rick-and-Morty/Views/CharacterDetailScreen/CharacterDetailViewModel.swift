//
//  CharacterDetailViewModel.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//

import Foundation

final class CharacterDetailViewModel {
    
    var characterDidChange: ((Character) -> Void)?
    var errorDidChange: ((Error?) -> Void)?
    
    private(set) var character: Character! = nil {
        didSet {
            characterDidChange?(character)
        }
    }
    
    private(set) var error: Error? = nil {
        didSet {
            errorDidChange?(error)
        }
    }
    
    private let characterUseCases: CharacterUseCases
    
    // MARK: Initializers
    init(_ useCases: CharacterUseCases) {
        characterUseCases = useCases
    }
    
    //MARK: Public Methods
    func getSingleCharacter(id: String) {
        
        Task {
            let response = await characterUseCases.getSingleCharacter(id: id)
            
            switch response {
            case .success(let character):
                DispatchQueue.main.async {
                    self.character = character
                }
            case .failure(let error):
                self.error = error
            }
        }
    }
}
