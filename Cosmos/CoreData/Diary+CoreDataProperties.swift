//
//  Diary+CoreDataProperties.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/2/2023.
//
//

import Foundation
import CoreData


extension Diary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diary> {
        return NSFetchRequest<Diary>(entityName: "Diary")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var day: Int32
    @NSManaged public var month: Int32
    @NSManaged public var year: Int32
    @NSManaged public var mood: String?
    @NSManaged public var weather: String?
    @NSManaged public var content: String?
    @NSManaged public var writeBy: Account?

}

extension Diary : Identifiable {

}
