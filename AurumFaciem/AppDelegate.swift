//
//  AppDelegate.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 27/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let CDAccess = DAOCoordinator()
        CDAccess.loadJSONs()
        let homeViewController = HomeScreenViewController(nibName: "HomeScreenViewController",
                                                          bundle: nil,
                                                          CDAccess: CDAccess)
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else {
            fatalError("AppDelegate")
        }
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.navigationBar.tintColor = AppColor.orange
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
