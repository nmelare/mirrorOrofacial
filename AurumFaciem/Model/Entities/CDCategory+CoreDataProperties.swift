//
//  CDCategory+CoreDataProperties.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 11/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//
//

import Foundation
import CoreData

extension CDCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategory> {
        return NSFetchRequest<CDCategory>(entityName: "CDCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var videos: CDVideo?
    @NSManaged public var lessons: NSOrderedSet?

}

// MARK: Generated accessors for lessons
extension CDCategory {

    @objc(insertObject:inLessonsAtIndex:)
    @NSManaged public func insertIntoLessons(_ value: CDLesson, at idx: Int)

    @objc(removeObjectFromLessonsAtIndex:)
    @NSManaged public func removeFromLessons(at idx: Int)

    @objc(insertLessons:atIndexes:)
    @NSManaged public func insertIntoLessons(_ values: [CDLesson], at indexes: NSIndexSet)

    @objc(removeLessonsAtIndexes:)
    @NSManaged public func removeFromLessons(at indexes: NSIndexSet)

    @objc(replaceObjectInLessonsAtIndex:withObject:)
    @NSManaged public func replaceLessons(at idx: Int, with value: CDLesson)

    @objc(replaceLessonsAtIndexes:withLessons:)
    @NSManaged public func replaceLessons(at indexes: NSIndexSet, with values: [CDLesson])

    @objc(addLessonsObject:)
    @NSManaged public func addToLessons(_ value: CDLesson)

    @objc(removeLessonsObject:)
    @NSManaged public func removeFromLessons(_ value: CDLesson)

    @objc(addLessons:)
    @NSManaged public func addToLessons(_ values: NSOrderedSet)

    @objc(removeLessons:)
    @NSManaged public func removeFromLessons(_ values: NSOrderedSet)

}
