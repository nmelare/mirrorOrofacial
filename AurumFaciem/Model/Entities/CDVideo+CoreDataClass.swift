//
//  CDVideo+CoreDataClass.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 10/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDVideo)
public class CDVideo: NSManagedObject {
    func modifyValues(path: URL,
                      word: String, allCategories: [CDCategory]?) {
        self.path = path
        self.word = word
        if let categories = allCategories {
            for category in categories {
                self.addToCategory(category)
            }
        }
    }
    static func newCDVideo() -> CDVideo {
        let context = PersistencyManager.getContext()
        guard let CDVideo = (
            NSEntityDescription.insertNewObject(
                forEntityName: PersistedEntity.video,
                into: context)
            ) as? CDVideo else {
                fatalError("Failed to create new CDVideo Instance")
        }
        return CDVideo
    }
}
