//
//  SceneDelegate.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navView = UINavigationController(rootViewController: OnboardingManagerViewController())
        

        if UserDefaults.isFirstAccess() == true {
            window.rootViewController = WelcomeViewController()
            window.makeKeyAndVisible()
            self.window = window
            return
        }
        
        window.rootViewController = navView
        window.makeKeyAndVisible()
        self.window = window
    }

}


