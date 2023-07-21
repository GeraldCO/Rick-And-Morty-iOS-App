//
//  CharacterListContainerViewController.swift
//  Rick-and-Morty
//
//  Created by Gerald on 20/7/23.
//
import UIKit

class CharacterListContainerViewController: UIViewController {

    @IBOutlet weak var characteListCollectionViewContainer: UIView!
    
    var viewModel: CharacterListViewModel
    
    private let characterListCollectionView: CharacterListCollectionViewController!
    
    init(_ viewModel: CharacterListViewModel) {
        
        self.viewModel = viewModel
        characterListCollectionView = CharacterListCollectionViewController(viewModel: viewModel)
        super.init(nibName: "CharacterListContainerViewController", bundle: Bundle(for: CharacterListContainerViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        
        add(viewController: characterListCollectionView, to: characteListCollectionViewContainer)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        title = "Rick & Morty Characters"
        // Set navigation bar visibility
        navigationController?.isNavigationBarHidden = false
        customizeNavigationBar()
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        title = ""
        super.viewWillDisappear(animated)
    }
    
    // MARK: Private_Methods
    private func customizeNavigationBar() {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let statusBarManager = windowScene.windows.first?.windowScene?.statusBarManager
        else { return }

        let statusBarView = UIView(frame: statusBarManager.statusBarFrame)
        statusBarView.backgroundColor = UIColor(named: "R&MPaletteGreen")
        view.addSubview(statusBarView)
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "R&MPaletteGreen")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "R&MPaletteGreen")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
