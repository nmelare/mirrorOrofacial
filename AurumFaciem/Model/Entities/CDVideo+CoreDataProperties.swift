//
//  CDVideo+CoreDataProperties.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 10/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

extension CDVideo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDVideo> {
        return NSFetchRequest<CDVideo>(entityName: "CDVideo")
    }

    @NSManaged public var path: URL?
    @NSManaged public var word: String?
    @NSManaged public var category: NSSet?

}

// MARK: Generated accessors for category
extension CDVideo {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: CDCategory)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: CDCategory)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}
