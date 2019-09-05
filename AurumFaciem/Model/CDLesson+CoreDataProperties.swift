//
//  CDLesson+CoreDataProperties.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 05/09/19.
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
    @NSManaged public var pending: Int32
    @NSManaged public var score: Int32
    @NSManaged public var videos: NSOrderedSet?

}

// MARK: Generated accessors for videos
extension CDLesson {

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
