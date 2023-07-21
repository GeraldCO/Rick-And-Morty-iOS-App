//
//  CharacterListCoordinator.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//

import UIKit

final class CharacterListCoordinator {
    
    let navigationController: UINavigationController
    private let characterListViewController: CharacterListContainerViewController
    private let characterListViewModel: CharacterListViewModel
    private var useCases: CharacterUseCases
    
    init(_ navController: UINavigationController) {
        
        navigationController = navController
        useCases = CharacterUseCases()
        characterListViewModel = CharacterListViewModel(useCases)
        characterListViewController = CharacterListContainerViewController(characterListViewModel)
    }
}

extension CharacterListCoordinator: Coordinator {
    
    func start() {
        
        characterListViewModel.coordinator = self
        navigationController.pushViewController(characterListViewController, animated: false)
    }
}

extension CharacterListCoordinator: CharacterListScreenCoordinatorRepresentable {
    
    func navigateToDetailScreen(with id: String) {
        
        let viewModel = CharacterDetailViewModel(useCases)
        let characterDetailViewController = CharacterDetailViewController(viewModel, id: id)
        navigationController.pushViewController(characterDetailViewController, animated: true)
    }
}
