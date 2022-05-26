public class BaseService  {
    unowned let realm : ServiceRealmType
    
    init(realm : ServiceRealmType){
        self.realm = realm
    }
}
