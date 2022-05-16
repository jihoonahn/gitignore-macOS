//
//  SwiftUIView.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/05/15.
//

import SwiftUI

extension View{
    public func scrollOptions(direction: Axis.Set) -> some View {
        let options = ScrollOptions(direction: direction)
        return self.environment(\.scrollOptions, options)
    }}
