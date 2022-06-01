//
//  GitignoreList+CoreDataProperties.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/06/01.
//
//

import Foundation
import CoreData


extension GitignoreList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GitignoreList> {
        return NSFetchRequest<GitignoreList>(entityName: "GitignoreList")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var gitignoreString: String?
    @NSManaged public var tags: [String]
}

extension GitignoreList : Identifiable {

}
