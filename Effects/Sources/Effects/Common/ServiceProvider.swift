public protocol ServiceEffectType : AnyObject{
    var effect : Effects {get}
}
public final class ServiceProvider : ServiceEffectType{
    public lazy  var effect: Effects = EffectService(effect: self)
    
    public init(){}
}
