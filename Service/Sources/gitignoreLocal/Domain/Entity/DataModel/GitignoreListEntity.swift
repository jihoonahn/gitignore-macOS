import Foundation
import RealmSwift

public class GitignoreListEntity : Object{
    @Persisted(primaryKey: true) public var id : ObjectId
    @Persisted public var date : Date
    @Persisted public var title : String
    @Persisted public var tags = List<String>()
    var arrayTags : [String]{
        get{
            return tags.map{ $0 }
        }
        set{
            tags.removeAll()
            tags.append(objectsIn: newValue)
        }
    }
    @Persisted public var gitignoreString : String
}

public extension GitignoreListEntity{
    func setup(gitignoreList : GitignoreList){
        self.title = gitignoreList.title
        self.date = gitignoreList.date
        self.arrayTags = gitignoreList.arrayTags
        self.gitignoreString = gitignoreList.gitignoreString
    }
}

public extension GitignoreListEntity{
    func toDomain() -> GitignoreList{
        return .init(
            title: title,
            arrayTags: arrayTags,
            date: date,
            gitignoreString: gitignoreString
        )
    }
}
