import SwiftUI

struct PreferenceSetter<ID: Hashable>: View {
    var id: ID
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ElementPreferenceKey.self, value: [ElementPreferenceData(id: AnyHashable(self.id), size: geometry.size)])
        }
    }
}
