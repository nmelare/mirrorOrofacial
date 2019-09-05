//
//  CDVideo+CoreDataClass.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 05/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDVideo)
public class CDVideo: NSManagedObject {
    func registerCDVideo(path: URL,
                         word: String,
                         category: String) {
        self.path = path
        self.word = word
        self.category = category
    }

    static func newCDVideo() -> CDVideo {
        let context = PersistencyManager.getContext()
        guard let CDVideo = (NSEntityDescription.insertNewObject(forEntityName: PersistedEntity.video,
                                                                 into: context)) as? CDVideo else {
            fatalError("Failed to create new CDVideo Instance")
        }
        return CDVideo
    }
}
