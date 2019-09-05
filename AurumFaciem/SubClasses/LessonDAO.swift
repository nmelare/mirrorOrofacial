//
//  LessonDAO.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 05/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import CoreData

class LessonDAO {
    //    Data Analysis Object
    func create(name: String, score: Int32, pending: Int32) {
        let newLesson = Lesson.newLesson()
        newLesson.registerLesson(name: name,
                                 score: score,
                                 pending: pending)
        PersistencyManager.saveContext()
    }
    
    func fetchAllLessons() -> [Lesson] {
        let persistedLessons: [Lesson] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.lesson)
        do {
            guard let persistedLessons = try PersistencyManager.getContext().fetch(fetchRequest) as? [Lesson] else {
                fatalError("fetchAll failure casting as Lesson")
            }
            return persistedLessons
        } catch let error {
            print("Lesson's fetchAll task failed", error.localizedDescription)
        }
        return persistedLessons
    }
    
    func fetchByCategory(category: String) -> [Lesson] {
        let foundLessons: [Lesson] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.lesson)
        fetchRequest.predicate = NSPredicate(format: "categoy = %@", category)
        do {
            guard let foundLessons = try PersistencyManager.getContext().fetch(fetchRequest) as? [Lesson] else {
                fatalError("fetchByCategory failure casting as Lesson")
            }
            return foundLessons
        } catch let error {
            print("Lesson's fetchByCategory task failed", error.localizedDescription)
        }
        return foundLessons
    }
    
    func delete(lesson: Lesson) {
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
