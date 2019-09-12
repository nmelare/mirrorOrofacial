//
//  CDLesson+CoreDataClass.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 10/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDLesson)
public class CDLesson: NSManagedObject {
    func modifyValues(name: String, progress: Int32, score: Int32, allCategories: [CDCategory]?) {
        self.name = name
        if let categories = allCategories {
            for category in categories {
                category.addToLessons(self)
            }
        }
    }
    static func newCDLesson() -> CDLesson {
        let context = PersistencyManager.getContext()
        guard let CDLesson = (
            NSEntityDescription.insertNewObject(
                forEntityName: PersistedEntity.lesson,
                into: context)
            ) as? CDLesson else {
                fatalError("Failed to create new CDLesson Instance")
        }
        return CDLesson
    }
}
