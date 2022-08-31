//
//  AppDelegate.swift
//  BasketFeature3.0
//
//  Created by Daniil on 30.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootView = UINavigationController(rootViewController: RegisterView())
//        let rootView = RegisterView()
        
        window?.rootViewController = rootView
        window?.makeKeyAndVisible()
        return true
    }

    

    


}

