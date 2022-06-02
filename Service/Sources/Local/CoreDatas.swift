import Foundation
import CoreData
import CombineCoreData
import Combine
import OSLogUtil

public protocol CoreDatas{
    func save(title : String, tags : [String], gitignoreString : String)
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
                Log.error(error, "Error")
            }
        }
    }
}

public extension CoreDataService{
    func save(title : String, tags : [String], gitignoreString : String) {
        let action : Action = {
            let gitignore : GitignoreList = self.createEntity()
            gitignore.id = UUID()
            gitignore.date = Date()
            gitignore.title = title
            gitignore.tags = tags
            gitignore.gitignoreString = gitignoreString
        }
        self.publisher(save: action)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { success in
                if success{
                    print("success")
                }
            }
    }
    
    func fetch() {
        let request = NSFetchRequest<GitignoreList>(entityName: "GitignoreList")
        do {
            let savedEntities = try container.viewContext.fetch(request)
            print(savedEntities)
        } catch let error {
            print("Error fetching GitignoreList Entities. \(error)")
        }
        print("fetch")
    }
    
    func delete() {
        print("delete")
    }
}
