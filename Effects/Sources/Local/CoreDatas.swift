import Foundation
import Combine
import CombineCoreData
import CoreData

public protocol CoreDatas{
    func addList(title : String, tag : [String], gitignoreString : String) -> CoreDataSaveModelPublisher
    func fetchPersons() -> CoreDataFetchResultsPublisher<List>
    func deleteAllPersons(title : String) -> CoreDataDeleteModelPublisher
}

public final class CoreDataService : BaseCoreDataService, CoreDatas{
    let coreDataStore: CoreDataStoring! = nil
}

public extension CoreDataService{
    func addList(title : String, tag : [String], gitignoreString : String) -> CoreDataSaveModelPublisher  {
        let action : Action = {
            let list : List = self.coreDataStore.createEntity()
            list.title =  title
            list.date = Date()
            list.tag = tag
            list.gitignoreString = gitignoreString
        }
        return coreDataStore
            .publisher(save: action)
        
    }
    func fetchPersons() -> CoreDataFetchResultsPublisher<List> {
        let request  = NSFetchRequest<List>(entityName: List.entityName)
        return coreDataStore
            .publisher(fetch: request)
    }
    func deleteAllPersons(title : String)  -> CoreDataDeleteModelPublisher{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: List.entityName)
        request.predicate = NSPredicate(format: "title LIKE[cd] %@", title)
        return coreDataStore
            .publisher(delete: request)
    }
}
