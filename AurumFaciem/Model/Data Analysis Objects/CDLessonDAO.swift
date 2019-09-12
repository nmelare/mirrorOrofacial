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
    func create(name: String, progress: Int32, score: Int32, pending: Int32) {
        let newCDLesson = CDLesson.newCDLesson()
        newCDLesson.modifyValues(name: name,
                                 progress: progress,
                                 score: score,
                                 allCategories: nil)
        PersistencyManager.saveContext()
    }

    func getAllLessons() -> [CDLesson] {
        let persistedCDLessons: [CDLesson] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.lesson)
        do {
            guard let persistedCDLessons = try PersistencyManager.getContext().fetch(fetchRequest) as? [CDLesson] else {
                fatalError("getAllLessons failure casting as CDLesson")
            }
            return persistedCDLessons
        } catch let error {
            print("CDLesson's getAllLessons task failed", error.localizedDescription)
        }
        return persistedCDLessons
    }

    func getCategoriesOf(lesson: CDLesson) -> [CDCategory] {
        let foundCDCategories: [CDCategory] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.category)
        fetchRequest.predicate = NSPredicate(format: "categories CONTAINS[cd] %@", lesson.name ?? "")
        do {
            guard let foundCDVideos = try PersistencyManager.getContext().fetch(fetchRequest) as? [CDCategory] else {
                fatalError("fetchByCategory failure casting as CDVideo")
            }
            return foundCDVideos
        } catch let error {
            print("CDVideo's fetchByCategory task failed", error.localizedDescription)
        }
        return foundCDCategories
    }

    func delete(lesson: CDLesson) {
        PersistencyManager.getContext().delete(lesson)
        PersistencyManager.saveContext()
    }

    func deleteAll() {
        let context = PersistencyManager.getContext()
        let lessons = getAllLessons()
        for lesson in lessons {
            context.delete(lesson)
        }
        PersistencyManager.saveContext()
    }
}
