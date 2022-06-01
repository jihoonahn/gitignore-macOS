import Foundation
import CoreData
import CombineCoreData
import Combine
import OSLogUtil

public protocol CoreDatas{
    func save()
    func fetch()
    func delete()
}

public final class CoreDataService : BaseCoreData, CoreDatas,CoreDataStoring{
        
    var bag: [AnyCancellable] = []

    private let container: NSPersistentContainer = NSPersistentContainer(name: "gitignoreList")
    public var viewContext: NSManagedObjectContext{
        self.container.viewContext
    }
    
    override init(coreData: ServiceCoreDataType) {
        super.init(coreData: ServiceCoreData.init())
        container.loadPersistentStores { _, error in
            if let error = error{
                Log.error(error.localizedDescription, "Error")
            }
        }
    }
}

public extension CoreDataService{
    func save() {
        print("Save")
    }
    
    func fetch() {
        print("fetch")
    }
    
    func delete() {
        print("delete")
    }
}
