//
//  CDVideoDAO.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 05/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import CoreData

class CDVideoDAO {
//    Data Analysis Object
    func newVideo(path: URL,
                  word: String,
                  category: [CDCategory]?) {
        let newCDVideo = CDVideo.newCDVideo()
        newCDVideo.modifyValues(path: path,
                                word: word,
                                allCategories: nil)
    }

    func getAllVideos() -> [CDVideo] {
        let persistedCDVideos: [CDVideo] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.video)
        do {
            guard let persistedCDVideos =
                try
                    PersistencyManager.getContext().fetch(fetchRequest) as? [CDVideo]
                else {
                    fatalError("getAllVideos failure casting as CDVideo")
            }
            return persistedCDVideos
        } catch let error {
            print("CDVideo's getAllVideos task failed", error.localizedDescription)
        }
        return persistedCDVideos
    }

    func getCategoriesOf(video: CDVideo) -> [CDCategory] {
        let foundCDCategories: [CDCategory] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.category)
        fetchRequest.predicate = NSPredicate(format: "videos CONTAINS[cd] %@", video.word ?? "")
        do {
            guard let foundCDCategories =
                try
                    PersistencyManager.getContext().fetch(fetchRequest) as? [CDCategory]
                else {
                    fatalError("fetchByCategory failure casting as CDVideo")
            }
            return foundCDCategories
        } catch let error {
            print("CDVideo's fetchByCategory task failed", error.localizedDescription)
        }
        return foundCDCategories
    }

    func delete(video: CDVideo) {
        PersistencyManager.getContext().delete(video)
        PersistencyManager.saveContext()
    }

    func deleteAll() {
        let context = PersistencyManager.getContext()
        let videos = getAllVideos()
        for video in videos {
            context.delete(video)
        }
        PersistencyManager.saveContext()
    }
}
