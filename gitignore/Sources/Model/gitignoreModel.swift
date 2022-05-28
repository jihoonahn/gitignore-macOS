import RealmSwift
import Foundation

class gitignoreModel : Object{
    @objc dynamic var id : UUID = .init()
    @objc dynamic var title = ""
    @objc dynamic var date = Date()
    dynamic var tags = List<StringObject>()
    override static func primaryKey() -> String? { return "id" }
}
class StringObject : Object{
    dynamic var value = ""
}
