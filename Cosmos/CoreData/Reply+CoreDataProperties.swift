//
//  Reply+CoreDataProperties.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/2/2023.
//
//

import Foundation
import CoreData


extension Reply {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reply> {
        return NSFetchRequest<Reply>(entityName: "Reply")
    }

    @NSManaged public var content: String?
    @NSManaged public var floor: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var time: String?
    @NSManaged public var accountOwner: Account?
    @NSManaged public var postOwner: Post?

}

extension Reply : Identifiable {

}
