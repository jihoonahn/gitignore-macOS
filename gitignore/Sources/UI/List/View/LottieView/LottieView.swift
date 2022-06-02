import SwiftUI
import Lottie
import AppKit

struct LottieView : NSViewRepresentable{
    typealias NSViewType = NSView
    var fileName : String
    
    func makeNSView(context: Context) -> NSView {
        let view = NSViewType(frame: .zero)
        let animationView = AnimationView()
        animationView.animation = Animation.named(fileName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        
    }
}
