//
//  AppDelegate.swift
//  Rick-and-Morty
//
//  Created by Gerald on 19/7/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        navigationController.navigationBar.tintColor = UIColor.white
        let landingScreenCoordinator = CharacterListCoordinator(navigationController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = landingScreenCoordinator.navigationController
        window?.makeKeyAndVisible()
        landingScreenCoordinator.start()
        return true
    }
}
