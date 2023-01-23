//
//  SceneDelegate.swift
//  CoinPrice
//
//  Created by Emil Guseynov on 17.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            let navController = UINavigationController()
            
            let coordinator = MainCoordinator()
            coordinator.navController = navController
            
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
            
            coordinator.start()
        }
}
