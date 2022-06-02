import Foundation
import CoreData
import CombineCoreData
import Combine
import OSLogUtil

public protocol CoreDatas{
    func save(title : String, tags : [String], gitignoreString : String)
    func fetch() -> [GitignoreList]
    func delete()
}

public final class CoreDataService : BaseCoreData, CoreDatas,CoreDataStoring{
    
    private let container: NSPersistentContainer = NSPersistentContainer(name: "gitignoreList")
    public var viewContext: NSManagedObjectContext{
        self.container.viewContext
    }
    
    override init(coreData: ServiceCoreDataType) {
        super.init(coreData: ServiceCoreData.init())
        container.loadPersistentStores { description, error in
            if let error = error{
                fatalError("Failed to load CoreData : \(error)")
            }
            print("Core data Loaded : \(description)")
        }
    }
}

public extension CoreDataService{
    func save(title : String, tags : [String], gitignoreString : String) {
        
    }
    
    func fetch() -> [GitignoreList]{
        let request = GitignoreList.fetchRequest()
        do {
            return try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching GitignoreList Entities. \(error)")
        }
        return []
    }
    
    func delete() {
        print("delete")
    }
}
