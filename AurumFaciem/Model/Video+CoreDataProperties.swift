//
//  Video+CoreDataProperties.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 03/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

extension Video {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Video> {
        return NSFetchRequest<Video>(entityName: "Video")
    }

    @NSManaged public var path: URL
    @NSManaged public var word: String
    @NSManaged public var category: String
    @NSManaged public var isPartOf: Lesson?

}
