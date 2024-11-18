//
//  SceneDelegate.swift
//  FractalTT
//
//  Created by Moyses Miranda do Vale Azevedo on 13/11/24.
//

import UIKit
import Coordinator
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController()

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let coordinator = MainCoordinator(nav: navController,
                                              coreDataContext: appDelegate.persistentContainer.viewContext)
            window.rootViewController = navController
            coordinator.start()
            window.makeKeyAndVisible()
            self.window = window
            return
        } else {
            fatalError()
        }
    }
}
