//
//  CDVideo+CoreDataProperties.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 05/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

extension CDVideo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDVideo> {
        return NSFetchRequest<CDVideo>(entityName: "CDVideo")
    }

    @NSManaged public var category: String?
    @NSManaged public var path: URL?
    @NSManaged public var word: String?
    @NSManaged public var isPartOf: NSOrderedSet?

}

// MARK: Generated accessors for isPartOf
extension CDVideo {

    @objc(insertObject:inIsPartOfAtIndex:)
    @NSManaged public func insertIntoIsPartOf(_ value: CDLesson, at idx: Int)

    @objc(removeObjectFromIsPartOfAtIndex:)
    @NSManaged public func removeFromIsPartOf(at idx: Int)

    @objc(insertIsPartOf:atIndexes:)
    @NSManaged public func insertIntoIsPartOf(_ values: [CDLesson], at indexes: NSIndexSet)

    @objc(removeIsPartOfAtIndexes:)
    @NSManaged public func removeFromIsPartOf(at indexes: NSIndexSet)

    @objc(replaceObjectInIsPartOfAtIndex:withObject:)
    @NSManaged public func replaceIsPartOf(at idx: Int, with value: CDLesson)

    @objc(replaceIsPartOfAtIndexes:withIsPartOf:)
    @NSManaged public func replaceIsPartOf(at indexes: NSIndexSet, with values: [CDLesson])

    @objc(addIsPartOfObject:)
    @NSManaged public func addToIsPartOf(_ value: CDLesson)

    @objc(removeIsPartOfObject:)
    @NSManaged public func removeFromIsPartOf(_ value: CDLesson)

    @objc(addIsPartOf:)
    @NSManaged public func addToIsPartOf(_ values: NSOrderedSet)

    @objc(removeIsPartOf:)
    @NSManaged public func removeFromIsPartOf(_ values: NSOrderedSet)

}
