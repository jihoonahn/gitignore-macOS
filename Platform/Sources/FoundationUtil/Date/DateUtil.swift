import Foundation

extension Date{
    public func usingDate(time : Date) -> String{
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd"
        return dataFormatter.string(from: time )
    }
}
