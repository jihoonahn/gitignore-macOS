//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/05/14.
//

import SwiftUI

@available(iOS 13, OSX 10.15, tvOS 13, watchOS 6, *)
public struct WaterfallGrid<Data, ID, Content>: View where Data : RandomAccessCollection, Content : View, ID : Hashable {

    @Environment(\.gridStyle) private var style
    @Environment(\.scrollOptions) private var scrollOptions

    private let data: Data
    private let dataId: KeyPath<Data.Element, ID>
    private let content: (Data.Element) -> Content

    @State private var loaded = false
    @State private var gridHeight: CGFloat = 0

    @State private var alignmentGuides = [AnyHashable: CGPoint]() {
        didSet { loaded = !oldValue.isEmpty }
    }
    
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                self.grid(in: geometry)
                    .onPreferenceChange(ElementPreferenceKey.self, perform: { preferences in
                        DispatchQueue.global(qos: .userInteractive).async {
                            let (alignmentGuides, gridHeight) = self.alignmentsAndGridHeight(columns: self.style.columns,
                                                                                             spacing: self.style.spacing,
                                                                                             scrollDirection: self.scrollOptions.direction,
                                                                                             preferences: preferences)
                            DispatchQueue.main.async {
                                self.alignmentGuides = alignmentGuides
                                self.gridHeight = gridHeight
                            }
                        }
                    })
            }
        }
        .frame(width: self.scrollOptions.direction == .horizontal ? gridHeight : nil,
               height: self.scrollOptions.direction == .vertical ? gridHeight : nil)
    }

    private func grid(in geometry: GeometryProxy) -> some View {
        let columnWidth = self.columnWidth(columns: style.columns, spacing: style.spacing,
                                           scrollDirection: scrollOptions.direction, geometrySize: geometry.size)
        return
            ZStack(alignment: .topLeading) {
                ForEach(data, id: self.dataId) { element in
                    self.content(element)
                        .frame(width: self.scrollOptions.direction == .vertical ? columnWidth : nil,
                               height: self.scrollOptions.direction == .horizontal ? columnWidth : nil)
                        .background(PreferenceSetter(id: element[keyPath: self.dataId]))
                        .alignmentGuide(.top, computeValue: { _ in self.alignmentGuides[element[keyPath: self.dataId]]?.y ?? 0 })
                        .alignmentGuide(.leading, computeValue: { _ in self.alignmentGuides[element[keyPath: self.dataId]]?.x ?? 0 })
                        .opacity(self.alignmentGuides[element[keyPath: self.dataId]] != nil ? 1 : 0)
                }
            }
            .animation(self.loaded ? self.style.animation : nil)
    }

    // MARK: - Helpers

    func alignmentsAndGridHeight(columns: Int, spacing: CGFloat, scrollDirection: Axis.Set, preferences: [ElementPreferenceData]) -> ([AnyHashable: CGPoint], CGFloat) {
        var heights = Array(repeating: CGFloat(0), count: columns)
        var alignmentGuides = [AnyHashable: CGPoint]()

        preferences.forEach { preference in
            if let minValue = heights.min(), let indexMin = heights.firstIndex(of: minValue) {
                let preferenceSizeWidth = scrollDirection == .vertical ? preference.size.width : preference.size.height
                let preferenceSizeHeight = scrollDirection == .vertical ? preference.size.height : preference.size.width
                let width = preferenceSizeWidth * CGFloat(indexMin) + CGFloat(indexMin) * spacing
                let height = heights[indexMin]
                let offset = CGPoint(x: 0 - (scrollDirection == .vertical ? width : height),
                                     y: 0 - (scrollDirection == .vertical ? height : width))
                heights[indexMin] += preferenceSizeHeight + spacing
                alignmentGuides[preference.id] = offset
            }
        }
        
        let gridHeight = max(0, (heights.max() ?? spacing) - spacing)
        
        return (alignmentGuides, gridHeight)
    }

    func columnWidth(columns: Int, spacing: CGFloat, scrollDirection: Axis.Set, geometrySize: CGSize) -> CGFloat {
        let geometrySizeWidth = scrollDirection == .vertical ? geometrySize.width : geometrySize.height
        let width = max(0, geometrySizeWidth - (spacing * (CGFloat(columns) - 1)))
        return width / CGFloat(columns)
    }
}

// MARK: - Initializers

extension WaterfallGrid {
    public init(_ data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.dataId = id
        self.content = content
    }

}

extension WaterfallGrid where ID == Data.Element.ID, Data.Element : Identifiable {
    public init(_ data: Data, content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.dataId = \Data.Element.id
        self.content = content
    }

}
