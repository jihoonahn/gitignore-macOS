import SwiftUI
import Lottie
import AppKit

struct LottieView : NSViewRepresentable{
    typealias NSViewType = NSView
    var fileName : String
    
    func makeNSView(context: Context) -> NSView {
        let views = NSViewType(frame: .zero)
        let animationView = AnimationView()
        animationView.animation = Animation.named(fileName)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        views.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalToConstant:  400),
            animationView.heightAnchor.constraint(equalToConstant:  250)
        ])
        
        return views
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        
    }
}
