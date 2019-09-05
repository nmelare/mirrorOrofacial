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
    func registerVideo(path: URL, word: String, category: String) throws {
        self.path = path
        self.word = word
        self.category = category
    }
}
