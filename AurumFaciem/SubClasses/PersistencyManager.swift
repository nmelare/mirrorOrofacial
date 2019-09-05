//
//  PersistencyManager.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 04/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PersistencyManager {
    private let context: NSManagedObjectContext
    private var _videos: [Video]
    private var _lessons: [Lesson]

    private static var sharedContextManager: PersistencyManager = {
        let contextManager = PersistencyManager()
        return contextManager
    }()

    public var videos: [Video] {
            var copy: [Video] = []
            copy.append(contentsOf: _videos)
            return copy
    }
    public var lessons: [Lesson] {
            var copy: [Lesson] = []
            copy.append(contentsOf: _lessons)
            return copy
    }

    private init() {
        let persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "AurumFaciem")
            container.loadPersistentStores(completionHandler: { (/*storeDescription*/_, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
        context = persistentContainer.viewContext
        do {
            _videos = try context.fetch(Video.fetchRequest())
            _lessons = try context.fetch(Lesson.fetchRequest())
        } catch {
            fatalError("Não foi possível recuperar os dados.")
        }
    }

    class func shared() -> PersistencyManager {
        return sharedContextManager
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
