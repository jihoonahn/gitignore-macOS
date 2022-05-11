import SwiftUI

struct NavigationListView: View {
    
    var body: some View {
        List {
            NavigationLink(destination: MainView(text: "Home")) {
                Label("Home", systemImage: "house.fill")
            }
            NavigationLink(destination: MainView(text: "List")) {
                Label("List", systemImage: "note.text")
            }
            
            Divider()
            
            NavigationLink(destination: MainView(text: "issue")) {
                Label("issue", systemImage: "exclamationmark.circle.fill")
            }
            
        }
        .frame(minWidth: 192, maxWidth: 256)
    }
}
