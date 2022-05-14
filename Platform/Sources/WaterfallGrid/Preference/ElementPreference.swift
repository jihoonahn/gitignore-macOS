import SwiftUI

struct ElementPreferenceData: Equatable {
    let id: AnyHashable
    let size: CGSize
}

struct ElementPreferenceKey: PreferenceKey {
    typealias Value = [ElementPreferenceData]

    static var defaultValue: [ElementPreferenceData] = []

    static func reduce(value: inout [ElementPreferenceData], nextValue: () -> [ElementPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
