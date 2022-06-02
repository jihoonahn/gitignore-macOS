import SwiftUI
import ComposableArchitecture

struct EditSheetView: View {
    
    private var store : Store<MainState, MainAction>

    init(store : Store<MainState, MainAction>){
        self.store = store
    }
    
    struct ViewState : Equatable{
        var titleQuery : String
        init(state : MainState){
            
            titleQuery = state.titleQuery
        }
    }
    
    var body: some View {
        WithViewStore(self.store.scope(state: ViewState.init)){ viewStore in
            VStack {
                Text("Edit your gitignore File")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                TextEditor(text: viewStore.binding(
                    get: \.titleQuery,send: MainAction.titleQueryChanged
                ))
                .font(.title3)
                .frame(minWidth: 400, minHeight: 200)

                Spacer()
                HStack {
                    Button("Cancel") {

                    }
                    Spacer()
                    Button("Save") {
                        viewStore.send(.saveGitignoreButtonDidTap)
                    }
                }
            }
            .frame(width: 500, height: 300)
            .padding()
        }
    }
}
