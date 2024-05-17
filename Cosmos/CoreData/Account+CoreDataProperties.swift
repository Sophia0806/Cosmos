//
//  Account+CoreDataProperties.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/2/2023.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var animal: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var releasePost: NSSet?
    @NSManaged public var releaseReply: NSSet?
    @NSManaged public var writeDiary: NSSet?

}

// MARK: Generated accessors for releasePost
extension Account {

    @objc(addReleasePostObject:)
    @NSManaged public func addToReleasePost(_ value: Post)

    @objc(removeReleasePostObject:)
    @NSManaged public func removeFromReleasePost(_ value: Post)

    @objc(addReleasePost:)
    @NSManaged public func addToReleasePost(_ values: NSSet)

    @objc(removeReleasePost:)
    @NSManaged public func removeFromReleasePost(_ values: NSSet)

}

// MARK: Generated accessors for releaseReply
extension Account {

    @objc(addReleaseReplyObject:)
    @NSManaged public func addToReleaseReply(_ value: Reply)

    @objc(removeReleaseReplyObject:)
    @NSManaged public func removeFromReleaseReply(_ value: Reply)

    @objc(addReleaseReply:)
    @NSManaged public func addToReleaseReply(_ values: NSSet)

    @objc(removeReleaseReply:)
    @NSManaged public func removeFromReleaseReply(_ values: NSSet)

}

// MARK: Generated accessors for writeDiary
extension Account {

    @objc(addWriteDiaryObject:)
    @NSManaged public func addToWriteDiary(_ value: Diary)

    @objc(removeWriteDiaryObject:)
    @NSManaged public func removeFromWriteDiary(_ value: Diary)

    @objc(addWriteDiary:)
    @NSManaged public func addToWriteDiary(_ values: NSSet)

    @objc(removeWriteDiary:)
    @NSManaged public func removeFromWriteDiary(_ values: NSSet)

}

extension Account : Identifiable {

}
