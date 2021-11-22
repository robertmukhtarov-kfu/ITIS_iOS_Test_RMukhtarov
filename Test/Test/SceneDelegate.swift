//
//  SceneDelegate.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = UIViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
