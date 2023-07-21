//
//  CharacterDetailViewController.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.

import UIKit
import Nuke

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var characterUIImageView: UIImageView!
    
    @IBOutlet weak var specieUILabel: UILabel!
    @IBOutlet weak var statusUILabel: UILabel!
    @IBOutlet weak var genderUILabel: UILabel!
    @IBOutlet weak var originUILabel: UILabel!
    @IBOutlet weak var firstSeenInUILabel: UILabel!
  
    private let viewModel: CharacterDetailViewModel
    private let id: String
    
    init(_ viewModel: CharacterDetailViewModel, id: String) {
        self.viewModel = viewModel
        self.id = id
        super.init(nibName: "CharacterDetailViewController", bundle: Bundle(for: CharacterDetailViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        title = ""
        setObservables()
        setNavigationBar()
        super.viewDidLoad()
        
        viewModel.getSingleCharacter(id: id)
    }
    
    private func setUI(with character: Character) {
        specieUILabel.text = character.species
        statusUILabel.text = character.status.rawValue
        genderUILabel.text = character.gender.rawValue
        originUILabel.text = character.origin.name
        firstSeenInUILabel.text = character.episode.first ?? "unknown"
        
        if let url = character.image {
            
            Nuke.loadImage(with: url, into: characterUIImageView)
        }
    }
    
    private func setObservables() {
        
        viewModel.characterDidChange = { [unowned self] character in
            
            var backgroundColor: UIColor?
            title = "\(viewModel.character.name)"
            
            switch viewModel.character.gender {
            case .male:
                backgroundColor = UIColor(named: "R&MPaletteSeanBlue")
            case .female:
                backgroundColor = UIColor(named: "R&MPaletteRed")
            case .genderless:
                backgroundColor = UIColor(named: "R&MPaletteYellow")
            case .unknown:
                backgroundColor = UIColor(named: "R&MPaletteGreen")
            }
            
            
            setNavigationBar(backgroundColor ?? UIColor.white)
            setUI(with: character)
        }
        
        viewModel.errorDidChange = { error in
            //show error mesage or error screen
        }
    }
    
    private func setNavigationBar(_ backgroundColor: UIColor = UIColor.white) {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let statusBarManager = windowScene.windows.first?.windowScene?.statusBarManager
        else { return }
        
        let statusBarView = UIView(frame: statusBarManager.statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
        
        navigationController?.navigationBar.barTintColor = backgroundColor
        navigationController?.navigationBar.backgroundColor = backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}














