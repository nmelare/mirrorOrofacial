//
//  CDLessonDAO.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 05/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import CoreData

class CDLessonDAO {
    //    Data Analysis Object
    func create(name: String, score: Int32, pending: Int32) {
        let newCDLesson = CDLesson.newCDLesson()
        newCDLesson.registerCDLesson(name: name,
                                 score: score,
                                 pending: pending)
        PersistencyManager.saveContext()
    }

    func fetchAllLessons() -> [CDLesson] {
        let persistedCDLessons: [CDLesson] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.lesson)
        do {
            guard let persistedCDLessons = try PersistencyManager.getContext().fetch(fetchRequest) as? [CDLesson] else {
                fatalError("fetchAll failure casting as CDLesson")
            }
            return persistedCDLessons
        } catch let error {
            print("CDLesson's fetchAll task failed", error.localizedDescription)
        }
        return persistedCDLessons
    }

    func delete(lesson: CDLesson) {
        PersistencyManager.getContext().delete(lesson)
        PersistencyManager.saveContext()
    }

    func deleteAll() {
        let context = PersistencyManager.getContext()
        let lessons = fetchAllLessons()
        for lesson in lessons {
            context.delete(lesson)
        }
        PersistencyManager.saveContext()
    }
}
