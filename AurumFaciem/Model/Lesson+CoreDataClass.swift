//
//  Lesson+CoreDataClass.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 03/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Lesson)
public class Lesson: NSManagedObject {
    func registerLesson(score: Int32, pending: Int32) {
        self.pending = score
        self.pending = pending
    }

    static func newVideo() -> Video {
        guard let video = (NSEntityDescription.insertNewObject(forEntityName: PersistedEntity.video,
                                                               into: PersistencyManager.getContext())) as? Video else {
                                                                fatalError("Não foi possívwl salvar um vídeo")
        }
        return video
    }
}
