//
//  Post+CoreDataProperties.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/2/2023.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var content: String?
    @NSManaged public var id: UUID?
    @NSManaged public var time: String?
    @NSManaged public var haveReplies: NSSet?
    @NSManaged public var postBy: Account?

}

// MARK: Generated accessors for haveReplies
extension Post {

    @objc(addHaveRepliesObject:)
    @NSManaged public func addToHaveReplies(_ value: Reply)

    @objc(removeHaveRepliesObject:)
    @NSManaged public func removeFromHaveReplies(_ value: Reply)

    @objc(addHaveReplies:)
    @NSManaged public func addToHaveReplies(_ values: NSSet)

    @objc(removeHaveReplies:)
    @NSManaged public func removeFromHaveReplies(_ values: NSSet)

}

extension Post : Identifiable {

}
