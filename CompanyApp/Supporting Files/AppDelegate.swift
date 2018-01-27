//
//  AppDelegate.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 24/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupRootVC()
        setupNavBarAppearance()
        
        return true
    }
    
    func setupRootVC() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let companiesController = CompaniesController()
        let navController = CustomNavigationController(rootViewController: companiesController)
        window?.rootViewController = navController
    }
    
    func setupNavBarAppearance() {
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .customRed
        let atts = [NSAttributedStringKey.foregroundColor: UIColor.customLightBlue]
        UINavigationBar.appearance().largeTitleTextAttributes = atts
        UINavigationBar.appearance().titleTextAttributes = atts
        UINavigationBar.appearance().tintColor = .customLightBlue
    }

}

