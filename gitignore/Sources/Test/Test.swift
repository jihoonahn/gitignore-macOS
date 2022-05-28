public protocol ServiceDataType : AnyObject{
    var coreData : CoreDatas {get}
}
public final class ServiceCoreData : ServiceDataType{
    public lazy var coreData: CoreDatas = CoreDataService(data: self)
    public init(){}
}

public class BaseCoreDataService  {
    unowned let data : ServiceDataType
    
    init(data : ServiceDataType){
        self.data = data
    }
}

import Foundation
import Combine
import CombineCoreData
import CoreData
import SwiftUI

public protocol CoreDatas{
    func addList(title : String, tag : [String], gitignoreString : String) -> CoreDataSaveModelPublisher?
    func fetchPersons() -> CoreDataFetchResultsPublisher<GitignoreModel>
    func deleteAllPersons(title : String) -> CoreDataDeleteModelPublisher
}

public final class CoreDataService : BaseCoreDataService, CoreDatas{
    let coreDataStore : CoreDataStoring = CoreDataStore.default
}

public extension CoreDataService{

    func addList(title : String, tag : [String], gitignoreString : String) -> CoreDataSaveModelPublisher?  {
        let action : Action = {
            let list : GitignoreModel = self.coreDataStore.createEntity()
            list.title =  title
            list.date = Date()
            list.tags = tag
            list.gitignoreString = gitignoreString
        }
        return coreDataStore
            .publisher(save: action)
    }
    func fetchPersons() -> CoreDataFetchResultsPublisher<GitignoreModel> {
        let request  = NSFetchRequest<GitignoreModel>(entityName: GitignoreModel.entityName)
        return coreDataStore
            .publisher(fetch: request)
    }
    func deleteAllPersons(title : String)  -> CoreDataDeleteModelPublisher{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: GitignoreModel.entityName)
        request.predicate = NSPredicate(format: "title LIKE[cd] %@", title)
        return coreDataStore
            .publisher(delete: request)
    }
}
