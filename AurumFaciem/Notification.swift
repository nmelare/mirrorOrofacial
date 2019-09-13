//
//  Notification.swift
//  AurumFaciem
//
//  Created by Nathalia Melare on 13/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import UserNotifications

class UserNotification {
    func userNotification() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                content.title = NSString.localizedUserNotificationString(forKey: "Continue praticando!", arguments: nil)
                content.body = NSString.localizedUserNotificationString(
                    forKey: "Leitura Orofacial precisa de dedicação!",
                                                                        arguments: nil)
                content.sound = UNNotificationSound.default

                let date = Date(timeIntervalSinceNow: 3600)
                let triggerDate = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

                let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)

                let center = UNUserNotificationCenter.current()
                center.add(request) { (error: Error?) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
