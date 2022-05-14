import SwiftUI

struct ScrollOptions {
    let direction: Axis.Set
}

struct ScrollOptionsKey: EnvironmentKey {
    static let defaultValue = ScrollOptions(direction: .vertical)
}

extension EnvironmentValues {
    var scrollOptions: ScrollOptions {
        get { self[ScrollOptionsKey.self] }
        set { self[ScrollOptionsKey.self] = newValue }
    }
}
