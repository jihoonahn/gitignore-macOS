//
//  GitignoreModel+CoreDataProperties.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/29.
//
//

import Foundation
import CoreData

extension GitignoreModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GitignoreModel> {
        return NSFetchRequest<GitignoreModel>(entityName: "GitignoreModel")
    }

    @NSManaged public var date: Date?
    @NSManaged public var gitignoreString: String?
    @NSManaged public var id: UUID?
    @NSManaged public var tags: [String]
    @NSManaged public var title: String?

}

extension GitignoreModel : Identifiable {

}
