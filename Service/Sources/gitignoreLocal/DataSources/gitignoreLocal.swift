import Combine
import RealmSwift
import Foundation

final public class GitignoreLocal{
    
    public static let shared = GitignoreLocal()
    
    private let realm = RealmTask.shared
    
    private init(){}
    
    public func fetchGitignoreRealm() -> AnyPublisher<[GitignoreList],Never>{
        return realm.fetchObjects(
            for: GitignoreListEntity.self,
            filter: .where(query: { entity in
                entity.title.equals(entity.title)
            })
        ).map{ $0.map{ $0.toDomain()}}.eraseToAnyPublisher()
    }
    
    public func saveGitignoreList(gitignoreList : GitignoreList)  {
        let add : GitignoreListEntity = {
            let entity = GitignoreListEntity()
            entity.setup(gitignoreList: gitignoreList)
            return entity
        }()
        realm.add(add)
    }

    public func deleteGitignoreList(id: UUID) {
        let list = realm.fetchObjectsResults(for: GitignoreListEntity.self).filter{ $0.id == id}
        realm.delete(list.reversed())
    }
}

