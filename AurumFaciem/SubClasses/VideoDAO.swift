//
//  VideoDAO.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 05/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import CoreData

class VideoDAO {
//    Data Analysis Object
    func create(from path: URL,
                word: String,
                category: String) {
        let newVideo = Video.newVideo()
        newVideo.registerVideo(path: path,
                               word: word,
                               category: category)
        PersistencyManager.saveContext()
    }

    func fetchAllVideos() -> [Video] {
        let persistedVideos: [Video] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.video)
        do {
            guard let persistedVideos = try PersistencyManager.getContext().fetch(fetchRequest) as? [Video] else {
                fatalError("fetchAll failure casting as Video")
            }
            return persistedVideos
        } catch let error {
            print("Video's fetchAll task failed", error.localizedDescription)
        }
        return persistedVideos
    }

    func fetchByCategory(category: String) -> [Video] {
        let foundVideos: [Video] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersistedEntity.video)
        fetchRequest.predicate = NSPredicate(format: "categoy = %@", category)
        do {
            guard let foundVideos = try PersistencyManager.getContext().fetch(fetchRequest) as? [Video] else {
                fatalError("fetchByCategory failure casting as Video")
            }
            return foundVideos
        } catch let error {
            print("Video's fetchByCategory task failed", error.localizedDescription)
        }
        return foundVideos
    }

    func delete(video: Video) {
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
