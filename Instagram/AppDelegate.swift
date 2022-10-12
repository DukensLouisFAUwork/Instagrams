//
//  AppDelegate.swift
//  Instagram
//
//  Created by dwork on 10/9/22.
//

import UIKit
import Parse

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let parseConfig = ParseClientConfiguration {
                $0.applicationId = "x1bIzw8727DBfj0PpvjXqo6AnIrAdqyV6SB8NlKC" // <- UPDATE
                $0.clientKey = "3eY8nRKtHzQN52i1JVlssb2NbNdikGyZZ9DC1LoB" // <- UPDATE
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)

        
        return true
    }

    // MARK: UISceneSession Lifecycle

  //  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
   //     return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  //  }

  //  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  //  }


}

