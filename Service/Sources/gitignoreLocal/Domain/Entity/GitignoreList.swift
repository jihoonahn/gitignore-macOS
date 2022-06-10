import Foundation
import RealmSwift
public struct GitignoreList : Equatable{
    public let id : UUID
    public let title : String
    public let date : Date
    public let arrayTags : [String]
    public let gitignoreString : String
    
    public init(
        id : UUID,
        title : String,
        arrayTags : [String],
        date : Date,
        gitignoreString : String
    ){
        self.id = id
        self.title = title
        self.arrayTags = arrayTags
        self.date = date
        self.gitignoreString = gitignoreString
    }
}
