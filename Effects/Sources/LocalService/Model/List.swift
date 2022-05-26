import RealmSwift
import Realm

class ListModel : Object{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title : String = .init()
    @objc dynamic var date = Date()
    @objc dynamic var tag : [String] = .init()
    @objc dynamic var gitignoreString : String = .init()
    override static func primaryKey() -> String? { return "id" }
    
    
    convenience init(title : String, tag : [String],gitignoreString : String){
        self.init()
        self.title = title
        self.tag = tag
        self.gitignoreString = gitignoreString
    }
}
