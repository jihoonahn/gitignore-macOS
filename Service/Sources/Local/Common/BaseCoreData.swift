public class BaseService  {
    unowned let coreData : ServiceCoreDataType
    
    init(coreData : ServiceCoreDataType){
        self.coreData = coreData
    }
}
