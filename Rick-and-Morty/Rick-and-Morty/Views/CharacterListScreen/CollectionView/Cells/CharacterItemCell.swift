//
//  CharacterItemCell.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//
import UIKit
import Nuke

class CharacterItemCell: UICollectionViewCell {

    @IBOutlet weak var characterUIImageView: UIImageView!
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var StatusAndSpeciesUILabel: UILabel!
    @IBOutlet weak var LastKnownLocationUILabel: UILabel!
    @IBOutlet weak var originLocationUILabel: UILabel!
    
    func configure(with character: Character) {
        
        nameUILabel.text = character.name
        StatusAndSpeciesUILabel.text = "\(character.status) - \(character.species)"
        LastKnownLocationUILabel.text = character.location.name
        originLocationUILabel.text = character.origin.name
        
        if let url = character.image {
            Nuke.loadImage(with: url, into: characterUIImageView)
        }
    }
}
