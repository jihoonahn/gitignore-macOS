//
//  BlurView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/11.
//

import SwiftUI

public struct BlurView : NSViewRepresentable{
    
    public init(){}
    
    public func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        
        return view
    }
    
    public func updateNSView(_ nsView: NSViewType, context: Context) {
        
    }
    
}
