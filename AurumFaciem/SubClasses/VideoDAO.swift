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
    func create(from path: URL,
                word: String,
                category: String) {
        let newCDVideo = CDVideo.newCDVideo()
        newCDVideo.registerCDVideo(path: path,
                               word: word,
                               category: category)
        PersistencyManager.saveContext()
    }

    func fetchAllVideos() -> [CDVideo] {
        let persistedCDVideos: [CDVideo] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.video)
        do {
            guard let persistedCDVideos = try PersistencyManager.getContext().fetch(fetchRequest) as? [CDVideo] else {
                fatalError("fetchAll failure casting as CDVideo")
            }
            return persistedCDVideos
        } catch let error {
            print("CDVideo's fetchAll task failed", error.localizedDescription)
        }
        return persistedCDVideos
    }

    func fetchByCategory(category: String) -> [CDVideo] {
        let foundCDVideos: [CDVideo] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.video)
        fetchRequest.predicate = NSPredicate(format: "categoy = %@", category)
        do {
            guard let foundCDVideos = try PersistencyManager.getContext().fetch(fetchRequest) as? [CDVideo] else {
                fatalError("fetchByCategory failure casting as CDVideo")
            }
            return foundCDVideos
        } catch let error {
            print("CDVideo's fetchByCategory task failed", error.localizedDescription)
        }
        return foundCDVideos
    }

    func delete(video: CDVideo) {
        PersistencyManager.getContext().delete(video)
        PersistencyManager.saveContext()
    }

    func deleteAll() {
        let context = PersistencyManager.getContext()
        let videos = fetchAllVideos()
        for video in videos {
            context.delete(video)
        }
        PersistencyManager.saveContext()
    }
}
