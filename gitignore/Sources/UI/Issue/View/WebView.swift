import SwiftUI
import WebKit

public struct WebView : NSViewRepresentable {
    let url: URL
    
    public func makeNSView(context: NSViewRepresentableContext<WebView>) -> WKWebView {
        WKWebView()
    }
    
    public func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<WebView>) {
        nsView.load(URLRequest(url: url))
    }
}
