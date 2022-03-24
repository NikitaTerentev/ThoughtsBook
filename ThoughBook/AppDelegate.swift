//
//  AppDelegate.swift
//  ThoughBook
//
//  Created by Nikita on 19.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let vc = InitialTableVC()
        self.navController = UINavigationController(rootViewController: vc)
        self.navController.navigationBar.prefersLargeTitles = true
        vc.navigationItem.title = "Books"
        vc.view.backgroundColor = .white
//        UIColor(cgColor: CGColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1))
    
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.navController
        
        self.window?.makeKeyAndVisible()


        return true
    }

 


}

