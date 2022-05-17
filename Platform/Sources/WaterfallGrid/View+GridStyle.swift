import SwiftUI

extension View{
    public func gridStyle(
        columns: Int = 4,
        spacing: CGFloat = 8,
        animation: Animation? = .default
    ) -> some View {
        let style = GridSyle(
            columnsInPortrait: columns,
            columnsInLandscape: columns,
            spacing: spacing,
            animation: animation
        )
        return self.environment(\.gridStyle, style)
    }
}
