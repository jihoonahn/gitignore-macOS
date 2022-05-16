import CombineRealm
import RealmSwift
import Foundation

class ListModel : Object{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title : String = ""
    @objc dynamic var time  = Date()
}

class ListModelex{
    var title : String
    var time = Date()
    var tag : [String]
    
    init(title: String, tag : [String]){
        self.title = title
        self.tag = tag
    }
}
