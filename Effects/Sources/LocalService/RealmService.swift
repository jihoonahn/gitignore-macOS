import CombineRealm
import Combine
import RealmSwift

public protocol Realms{    
    func saveList(title : String, tag : [String] ,gitignoreString : String)
    func readList()
    func deleteList(index : Int)
}

public final class RealmService : BaseService, Realms{
    
    let realms = try! Realm()
    lazy var lists : Results<ListModel> = realms.objects(ListModel.self)
    
    let addedlists = PassthroughSubject<ListModel, Never>()
    let deletedlists = PassthroughSubject<ListModel, Never>()
    
    var subscriptions = Set<AnyCancellable>()
}

public extension RealmService{

    func saveList(title: String, tag: [String], gitignoreString: String) {
//        let list = ListModel(title: title, tag: tag, gitignoreString: gitignoreString)
//        try!  realms.write{
//            realms.add(list)
//        }
        addedlists
            .addToRealm()
            .store(in: &subscriptions)
    }
    func readList(){
        RealmPublishers.collection(from: lists)
            .map{ results in "\(results.count)"}
            .sink(receiveCompletion: { _ in}, receiveValue: { result in
                print(result)
            }).store(in: &subscriptions)
    }
    func deleteList(index : Int) {
        deletedlists
            .deleteFromRealm()
            .store(in: &subscriptions)
    }
}
