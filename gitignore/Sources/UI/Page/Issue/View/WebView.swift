//
//  WebView.swift
//  gitignore
//
//  Created by Ji-hoon Ahn on 2022/05/22.
//

import SwiftUI
import WebKit

struct WebView : NSViewRepresentable {
    let url: URL
    
    public func makeNSView(context: NSViewRepresentableContext<WebView>) -> WKWebView {
        WKWebView()
    }
    
    public func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<WebView>) {
        nsView.load(URLRequest(url: url))
    }
}
