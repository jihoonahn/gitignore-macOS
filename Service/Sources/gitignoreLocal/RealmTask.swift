import Foundation
import RealmSwift
import Combine

protocol ObjectPropertyUpdatable {}
extension ObjectPropertyUpdatable where Self: Object {
    func update(_ block: (Self) throws -> Void) rethrows {
        try? self.realm?.safeWrite {
            try? block(self)
        }
    }
}
extension Object: ObjectPropertyUpdatable {}

protocol RealmTaskType: AnyObject {
    func fetchObjects<T: Object>(
        for type: T.Type,
        filter: QueryFilter<T>?,
        sortProperty: String?,
        ordering: OrderingType
    ) -> AnyPublisher<[T],Never>
    
    func add(_ object: Object?)
    func add(_ objects: [Object]?)
    func set(_ object: Object?)
    func set(_ objects: [Object]?)
    func delete(_ object: Object?)
    func delete(_ objects: [Object]?)
}

final public  class RealmTask: RealmTaskType {
    
    static public let shared = RealmTask()
    
    private let realm: Realm
    
    public init(realm: Realm) {
        self.realm = realm
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    public init() {
        guard let realm = try? Realm() else { fatalError() }
        self.realm = realm
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    public func fetchObjects<T: Object>(
        for type: T.Type,
        filter: QueryFilter<T>? = nil,
        sortProperty: String? = nil,
        ordering: OrderingType = .ascending
    )  -> AnyPublisher<[T],Never>{
        let res = self.fetchObjectsResults(
            for: T.self,
            filter: filter,
            sortProperty: sortProperty,
            ordering: ordering
        )
        
        return Just(res.reversed()).eraseToAnyPublisher()
    }
    
    public func fetchObjectsResults<T: Object>(
        for type: T.Type,
        filter: QueryFilter<T>? = nil,
        sortProperty: String? = nil,
        ordering: OrderingType = .ascending
    ) -> Results<T> {
        var res = realm.objects(T.self)
        if let filter = filter {
            switch filter {
            case let .string(query):
                res = res.filter(query)
            case let .predicate(query):
                res = res.filter(query)
            case let .where(query):
                res = res.where(query)
            }
        }
        if let sortProperty = sortProperty {
            res = res.sorted(byKeyPath: sortProperty, ascending: ordering == .ascending)
        }
        return res
    }
    
    public  func add(_ object: Object?) {
        guard let object = object else { return }
        try? realm.write {
            realm.add(object)
        }
    }
    
    public func add(_ objects: [Object]?) {
        guard let objects = objects else { return }
        try? realm.write {
            realm.add(objects)
        }
    }
    
    public func set(_ object: Object?) {
        guard let object = object else { return }
        try? realm.safeWrite {
            realm.add(object, update: .all)
        }
    }
    
    public func set(_ objects: [Object]?) {
        guard let objects = objects else { return }
        try? realm.safeWrite {
            realm.add(objects, update: .all)
        }
    }
    
    public func delete(_ object: Object?) {
        guard let object = object else { return }
        try? realm.safeWrite {
            realm.delete(object)
        }
    }
    
    public func delete(_ objects: [Object]?) {
        guard let objects = objects else { return }
        try? realm.safeWrite {
            realm.delete(objects)
        }
    }
    
    public func deleteAll() {
        try? realm.safeWrite {
            realm.deleteAll()
        }
    }
}
