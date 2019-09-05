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
    func registerLesson(score: Int32, pending: Int32) throws {
        self.pending = score
        self.pending = pending
    }
}
