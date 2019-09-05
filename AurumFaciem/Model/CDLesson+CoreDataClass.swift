//
//  CDLesson+CoreDataClass.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 05/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDLesson)
public class CDLesson: NSManagedObject {
    func registerCDLesson(name: String,
                          score: Int32,
                          pending: Int32) {
        self.name = name
        self.score = score
        self.pending = pending
    }

    static func newCDLesson() -> CDLesson {
        let context = PersistencyManager.getContext()
        guard let CDLesson = (NSEntityDescription.insertNewObject(forEntityName: PersistedEntity.lesson,
                                                                  into: context)) as? CDLesson else {
                                                                    fatalError("Failed to create new CDLesson Instance")
        }
        return CDLesson
    }
}
