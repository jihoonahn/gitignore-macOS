import SwiftUI
import Swinject
import ComposableArchitecture
import RealmSwift

@main
struct gitignoreApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }.windowStyle(HiddenTitleBarWindowStyle())
    }
}

