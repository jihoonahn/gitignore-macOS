import CombineRealm
import RealmSwift
import Foundation

class ListModel : Object{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title : String = ""
    @objc dynamic var time  = Date()
    @objc dynamic var tag  : [String] = .init()
}

class ListModelex{
    var title : String
    var time = Date()
    var tag : [String]
    var bookMark : Bool
    
    init(title: String, tag : [String], bookMark : Bool){
        self.title = title
        self.tag = tag
        self.bookMark = bookMark
    }
}
