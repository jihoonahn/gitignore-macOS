import Combine
import RealmSwift
import Foundation

final public class GitignoreLocal{
    
    public static let shared = GitignoreLocal()
    
    private let realm = RealmTask.shared
    
    private init(){}
    
    public func saveGitignoreList(gitignoreList : GitignoreList)  {
        let add : GitignoreListEntity = {
            let entity = GitignoreListEntity()
            entity.setup(gitignoreList: gitignoreList)
            return entity
        }()
        realm.add(add)
    }

    public func deleteGitignoreList(id: ObjectId) {
        let list = realm.fetchObjectsResults(for: GitignoreListEntity.self).filter{ $0.id == id}
        realm.delete(list.reversed())
    }
}

