//
//  CDCategoryDAO.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 12/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import CoreData

class CDCategoryDAO {
    //    Data Analysis Object
    func newCategory(name: String) -> CDCategory {
        let newCDCategory = CDCategory.newCDCategory()
        newCDCategory.modifyValues(name: name,
                                   allLessons: nil,
                                   allVideos: nil)
        return newCDCategory
    }

    func getAllCategories() -> [CDCategory] {
        let persistedCDCategory: [CDCategory] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.category)
        do {
            guard let persistedCDCategory =
                try
                    PersistencyManager.getContext().fetch(fetchRequest) as? [CDCategory]
                else {
                    fatalError("getAllCategories failure casting as CDCategory")
            }
            return persistedCDCategory
        } catch let error {
            print("CDCategory's getAllCategories task failed", error.localizedDescription)
        }
        return persistedCDCategory
    }

    func fetchByName(_ name: String) -> CDCategory? {
        let persistedCDCategory: [CDCategory] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.category)
        fetchRequest.predicate = NSPredicate(format: "name ==[cd] %@", name)
        do {
            guard let persistedCDCategory =
                try
                    PersistencyManager.getContext().fetch(fetchRequest) as? [CDCategory]
                else {
                    fatalError("getAllCategories failure casting as CDCategory")
            }
            return persistedCDCategory.first
        } catch let error {
            print("CDCategory's getAllCategories task failed", error.localizedDescription)
        }
        return persistedCDCategory.first
    }

    func getVideosByCategory(category: CDCategory) -> [CDVideo] {
        let foundCDVideos: [CDVideo] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.video)
        fetchRequest.predicate = NSPredicate(format: "category CONTAINS[cd] %@", category.name ?? "")
        do {
            guard let foundCDVideos =
                try
                    PersistencyManager.getContext().fetch(fetchRequest) as? [CDVideo]
                else {
                    fatalError("getVideosByCategory failure casting as CDVideo")
            }
            return foundCDVideos
        } catch let error {
            print("CDCategory's getVideosByCategory task failed", error.localizedDescription)
        }
        return foundCDVideos
    }

    func getLessonsByCategory(category: CDCategory) -> [CDLesson] {
        let foundCDLessons: [CDLesson] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.lesson)
        fetchRequest.predicate = NSPredicate(format: "categories CONTAINS[cd] %@", category.name ?? "")
        do {
            guard let foundCDLessons =
                try
                    PersistencyManager.getContext().fetch(fetchRequest) as? [CDLesson]
                else {
                    fatalError("getLessonsByCategory failure casting as CDLesson")
            }
            return foundCDLessons
        } catch let error {
            print("CDCategory's getLessonsByCategory task failed", error.localizedDescription)
        }
        return foundCDLessons
    }

    func delete(category: CDCategory) {
        PersistencyManager.getContext().delete(category)
        PersistencyManager.saveContext()
    }

    func deleteAll() {
        let context = PersistencyManager.getContext()
        let categories = getAllCategories()
        for category in categories {
            context.delete(category)
        }
        PersistencyManager.saveContext()
    }
}
