import Foundation
import CoreData

public protocol CoreDatas{
    func save()
    func fetch()
    func delete()
}

public final class CoreDataService : BaseCoreData, CoreDatas{
    
}

public extension CoreDataService{
    func save() {
        
    }
    
    func fetch() {
        
    }
    
    func delete() {
        
    }
}
