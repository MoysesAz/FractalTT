//
//  AppDelegate.swift
//  FractalTT
//
//  Created by Moyses Miranda do Vale Azevedo on 13/11/24.
//

import UIKit
import CoreData

@main
public class AppDelegate: UIResponder, UIApplicationDelegate {
    public func application(_ application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    public func application(_ application: UIApplication,
                            configurationForConnecting connectingSceneSession: UISceneSession,
                            options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    public func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataF" )
        container.loadPersistentStores(completionHandler: { ( storeDescription, error) in
            if let error = error as NSError? {
                fatalError("\(error)")
            }
        })
        return container
    }()

    public func saveContent() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("\(nserror)")
            }
        }
    }
}
