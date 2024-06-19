//
//  SceneDelegate.swift
//  MVVMTutorial
//
//  Created by MacBook Pro on 28/03/2024.
//

import UIKit

protocol SceneDLGProtocol: NSObject {
    func changeView(typeScreen: TypeScreen)
}

enum TypeScreen {
    case login
    case tabbar
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UITabBarControllerDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        changeScreen(type: .login)
        UserDefaults.standard.set("Nguyen Cong Tuan", forKey: "name")
        UserDefaults.standard.set("20", forKey: "age")
        UserDefaults.standard.set("163 cm", forKey: "height")
        UserDefaults.standard.set("58 kg", forKey: "weight")
        UserDefaults.standard.set("tuancong146@gmail.com", forKey: "email")
        UserDefaults.standard.set("1111", forKey: "password")
    }
    
    private func createTabbar() {
//        Home
        let homeVC = HomeViewController()
        homeVC.viewModel.sceneDLG = self
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
//        Messages
        let messagesVC = MessagesViewController()
        let messagesNavi = UINavigationController(rootViewController: messagesVC)
        messagesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        
//        Friends
        let friendsVC = FriendsViewController()
        let friendsNavi = UINavigationController(rootViewController: friendsVC)
        friendsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
//        Profile
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
//        tabbar controller
        let tabbarController = UITabBarController()
        tabbarController.delegate = self
        tabbarController.viewControllers = [homeNavi, messagesNavi, friendsNavi, profileNavi]
        window!.rootViewController = tabbarController
        }
    
    private func createLogin() {
        let loginVC = LoginViewController()
        
        let loginNavi = UINavigationController(rootViewController: loginVC)
        
        
        
        window?.rootViewController = loginNavi
    }
    
    func changeScreen(type: TypeScreen) {
        switch type {
        case .login:
            createLogin()
        case .tabbar:
            createTabbar()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension SceneDelegate: SceneDLGProtocol {
    func changeView(typeScreen: TypeScreen) {
        self.changeScreen(type: typeScreen)
    }
}
