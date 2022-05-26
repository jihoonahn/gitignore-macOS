import RealmSwift

class ListModel : Object{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title : String = .init()
    @objc dynamic var time  = Date()
    @objc dynamic var tag  : [String] = .init()
    @objc dynamic var gitignoreString : String = .init()
    override class func primaryKey() -> String? {return "id"}
}
