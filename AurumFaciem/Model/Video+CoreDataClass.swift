//
//  Video+CoreDataClass.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 03/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Video)
public class Video: NSManagedObject {
    func registerVideo(path: URL, word: String, category: String) {
        self.path = path
        self.word = word
        self.category = category
    }

    static func newVideo() -> Video {
        guard let video = (NSEntityDescription.insertNewObject(forEntityName: PersistedEntity.video,
                                                              into: PersistencyManager.getContext())) as? Video else {
            fatalError("Não foi possívwl salvar um vídeo")
        }
        return video
    }
}
