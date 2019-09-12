//
//  CDCategory+CoreDataClass.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 11/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDCategory)
public class CDCategory: NSManagedObject {
    func modifyValues(name: String, allLessons: [CDLesson]?, allVideos: [CDVideo]?) {
        self.name = name
        if let lessons = allLessons {
            for lesson in lessons {
                self.addToLessons(lesson)
            }
        }
        if let videos = allVideos {
            for video in videos {
                video.addToCategory(self)
            }
        }
    }
    static func newCDCategory() -> CDCategory {
        let context = PersistencyManager.getContext()
        guard
            let CDCategory = (
                NSEntityDescription.insertNewObject(
                    forEntityName: PersistedEntity.category,
                    into: context)
                ) as? CDCategory else {
                    fatalError("Failed to create new CDCategory Instance")
        }
        return CDCategory
    }
}
