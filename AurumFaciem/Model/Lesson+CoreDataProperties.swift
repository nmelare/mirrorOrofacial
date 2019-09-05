//
//  Lesson+CoreDataProperties.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 03/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

extension Lesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lesson> {
        return NSFetchRequest<Lesson>(entityName: "Lesson")
    }

    @NSManaged public var score: Int32
    @NSManaged public var pending: Int32
    @NSManaged public var name: String
    @NSManaged public var videos: Video?

}
