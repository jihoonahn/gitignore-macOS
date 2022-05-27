//
//  List+CoreDataProperties.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/28.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var gitignoreString: String?
    @NSManaged public var tags: [String]
    @NSManaged public var date: Date?
    @NSManaged public var title: String?

}

extension List : Identifiable {

}
