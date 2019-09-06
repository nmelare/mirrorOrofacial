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
    
    var navigationController: UINavigationController?
    
//    let libraryinfo = LibraryInfoViewController.init()
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let videoDAO = CDVideoDAO()
        let lessonDAO = CDLessonDAO()
        let homeViewController = HomeScreenViewController(nibName: "HomeScreenViewController",
                                                          bundle: nil,
                                                          videoDAO: videoDAO,
                                                          lessonDAO: lessonDAO)
        window = UIWindow(frame: UIScreen.main.bounds)
        navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9215686275, green: 0.568627451, blue: 0.4745098039, alpha: 1)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
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
