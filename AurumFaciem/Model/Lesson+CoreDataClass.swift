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
    func registerLesson(name: String, score: Int32, pending: Int32) {
        self.name = name
        self.score = score
        self.pending = pending
    }

    static func newLesson() -> Lesson {
        guard let lesson = (NSEntityDescription.insertNewObject(forEntityName: PersistedEntity.lesson,
                                                               into: PersistencyManager.getContext())) as? Lesson else {
                                                                fatalError("Não foi possívwl salvar um vídeo")
        }
        return lesson
    }
}
