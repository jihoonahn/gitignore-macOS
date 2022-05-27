import SwiftUI
import ComposableArchitecture
import gitignoreView

struct IssueView: View {
    let store : Store<IssueState,IssueAction>
    
    var body: some View {
        WithViewStore(self.store){ viewStore in
            WebView(url: viewStore.issuePageURL!)
                .padding(.leading,-10)
        }
    }
}
