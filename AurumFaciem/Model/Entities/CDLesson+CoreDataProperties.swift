//
//  CDLesson+CoreDataProperties.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 10/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

extension CDLesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDLesson> {
        return NSFetchRequest<CDLesson>(entityName: "CDLesson")
    }

    @NSManaged public var name: String?
    @NSManaged public var progress: Int32
    @NSManaged public var score: Int32
    @NSManaged public var categories: NSSet?

}

// MARK: Generated accessors for categories
extension CDLesson {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: CDCategory)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: CDCategory)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}
