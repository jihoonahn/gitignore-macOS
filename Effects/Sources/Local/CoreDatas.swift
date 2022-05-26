import Foundation
import Combine
import CombineCoreData

public protocol CoreDatas{
    func addList()
    func fetchPersons()
    func deleteAllPersons()
}

public final class CoreDataService : BaseCoreDataService, CoreDatas{
    private var bag : [AnyCancellable] = .init()
    
}


public extension CoreDataService{
    func addList()  {
        let action : Action = {
            
        }
    }
    func fetchPersons()  {

    }
    func deleteAllPersons() {

    }
}
