public protocol ServiceRealmType : AnyObject{
    var realms : Realms {get}
    
}
public final class ServiceRealm : ServiceRealmType{
    public lazy var realms: Realms = RealmService(realm: self)
    
    public init(){}
}
