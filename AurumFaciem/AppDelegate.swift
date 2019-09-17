//
//  AppDelegate.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 27/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationCenter = UNUserNotificationCenter.current()

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let videoDAO = CDVideoDAO()
        let lessonDAO = CDLessonDAO()
//        videoDAO.saveVideo()
//        lessonDAO.saveLesson()
        let homeViewController = HomeScreenViewController(nibName: "HomeScreenViewController",
                                                          bundle: nil,
                                                          videoDAO: videoDAO,
                                                          lessonDAO: lessonDAO)
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.navigationBar.tintColor = #colorLiteral(red: 0.9215686275, green: 0.568627451, blue: 0.4745098039, alpha: 1)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

            let options: UNAuthorizationOptions = [.alert, .sound, .badge]
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.requestAuthorization(options: options) { (didAllow, error) in
                if !didAllow {
                    print("Notifications not allowed by user")
                }
            }
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
