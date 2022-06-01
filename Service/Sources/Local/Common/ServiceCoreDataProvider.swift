public protocol ServiceCoreDataType : AnyObject{
    var coreData : CoreDatas {get}
}
public final class ServiceCoreData : ServiceCoreDataType{
    public lazy  var coreData: CoreDatas = CoreDataService(coreData: self)

    public init(){}
}
