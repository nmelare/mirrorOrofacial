//
//  DAOCoordinator.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 12/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation

class DAOCoordinator {
    let videoDAO = CDVideoDAO()
    let lessonDAO = CDLessonDAO()
    let categoryDAO = CDCategoryDAO()

    func loadJSONs() {
        videoDAO.deleteAll()
        lessonDAO.deleteAll()
        categoryDAO.deleteAll()

        let defaultCategory = categoryDAO.newCategory(name: "")

        let videos = VideoHandler.getAllVideos()
        for video in videos {
            self.videoDAO.newVideo(path: URL(fileURLWithPath: video.path),
                                   word: video.word,
                                   category: [categoryDAO.fetchByName(video.category) ?? defaultCategory])
        }

        let lessons = LessonHandler.getAllLessons()
        for lesson in lessons {
            var categories: [CDCategory] = []
            for category in lesson.videos {
                if let oldCategory = categoryDAO.fetchByName(category) {
                    categories.append(oldCategory)
                } else {
                    categories.append(categoryDAO.newCategory(name: category))
                }
            }
            if categories.isEmpty { categories.append(defaultCategory) }
            self.lessonDAO.newVideo(name: lesson.name,
                                    progress: Int32(lesson.pending),
                                    score: Int32(lesson.score),
                                    categories: categories)
        }
        PersistencyManager.saveContext()
    }
}
