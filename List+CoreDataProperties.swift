//
//  List+CoreDataProperties.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/26.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var date: Date?
    @NSManaged public var gitignoreString: String?
    @NSManaged public var tag: [String]
    @NSManaged public var title: String?

}

extension List : Identifiable {

}
