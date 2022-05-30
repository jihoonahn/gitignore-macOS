public protocol ServiceDataType : AnyObject{
    var coreData : CoreDatas {get}
}
public final class ServiceCoreData : ServiceDataType{
    public lazy var coreData: CoreDatas = CoreDataService(data: self)
    public init(){}
}
