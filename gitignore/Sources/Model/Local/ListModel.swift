import CombineRealm
import RealmSwift
import Foundation

class ListModel : Object{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title : String = ""
    @objc dynamic var time  = Date()
}

