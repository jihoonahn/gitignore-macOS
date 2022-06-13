import Foundation

@propertyWrapper
struct PositiveNumber {
    private var value: Int = 1
    
    var wrappedValue: Int {
        get { value }
        set { value = max(1, newValue) }
    }
    
    init(wrappedValue initialValue: Int) {
        self.wrappedValue = initialValue
    }
}
