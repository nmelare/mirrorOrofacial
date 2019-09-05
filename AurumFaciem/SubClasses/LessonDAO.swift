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

    func fetchAllCDLessons() -> [CDLesson] {
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

    func fetchByCategory(category: String) -> [CDLesson] {
        let foundCDLessons: [CDLesson] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.lesson)
        fetchRequest.predicate = NSPredicate(format: "categoy = %@", category)
        do {
            guard let foundCDLessons = try PersistencyManager.getContext().fetch(fetchRequest) as? [CDLesson] else {
                fatalError("fetchByCategory failure casting as CDLesson")
            }
            return foundCDLessons
        } catch let error {
            print("CDLesson's fetchByCategory task failed", error.localizedDescription)
        }
        return foundCDLessons
    }

    func delete(lesson: CDLesson) {
        PersistencyManager.getContext().delete(lesson)
        PersistencyManager.saveContext()
    }

    func deleteAll() {
        let context = PersistencyManager.getContext()
        let lessons = fetchAllCDLessons()
        for lesson in lessons {
            context.delete(lesson)
        }
        PersistencyManager.saveContext()
    }
}
