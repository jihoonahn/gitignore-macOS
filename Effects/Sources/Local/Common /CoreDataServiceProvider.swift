public protocol ServiceDataType : AnyObject{
    var coreData : CoreDatas {get}
}
public final class ServiceEffect : ServiceDataType{
    public lazy var coreData: CoreDatas = CoreDataService(data: self)
    public init(){}
}
