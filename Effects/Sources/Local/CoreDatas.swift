import Foundation
import Combine
import CombineCoreData

public protocol CoreDatas{
    func addList()
    func fetchPersons()
    func deleteAllPersons()
}

public final class CoreDataService : BaseCoreDataService, CoreDatas{}


public extension CoreDataService{
    func addList() {
        
    }
    func fetchPersons() {
        
    }
    func deleteAllPersons() {
        
    }
}
