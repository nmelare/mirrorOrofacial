//
//  CDCategory+CoreDataProperties.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 13/09/19.
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
    @NSManaged public var lessons: NSOrderedSet?
    @NSManaged public var videos: NSOrderedSet?

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

// MARK: Generated accessors for videos
extension CDCategory {

    @objc(insertObject:inVideosAtIndex:)
    @NSManaged public func insertIntoVideos(_ value: CDVideo, at idx: Int)

    @objc(removeObjectFromVideosAtIndex:)
    @NSManaged public func removeFromVideos(at idx: Int)

    @objc(insertVideos:atIndexes:)
    @NSManaged public func insertIntoVideos(_ values: [CDVideo], at indexes: NSIndexSet)

    @objc(removeVideosAtIndexes:)
    @NSManaged public func removeFromVideos(at indexes: NSIndexSet)

    @objc(replaceObjectInVideosAtIndex:withObject:)
    @NSManaged public func replaceVideos(at idx: Int, with value: CDVideo)

    @objc(replaceVideosAtIndexes:withVideos:)
    @NSManaged public func replaceVideos(at indexes: NSIndexSet, with values: [CDVideo])

    @objc(addVideosObject:)
    @NSManaged public func addToVideos(_ value: CDVideo)

    @objc(removeVideosObject:)
    @NSManaged public func removeFromVideos(_ value: CDVideo)

    @objc(addVideos:)
    @NSManaged public func addToVideos(_ values: NSOrderedSet)

    @objc(removeVideos:)
    @NSManaged public func removeFromVideos(_ values: NSOrderedSet)

}
