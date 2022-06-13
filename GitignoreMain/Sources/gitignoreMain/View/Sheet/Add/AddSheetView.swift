import SwiftUI
import ComposableArchitecture

struct AddSheetView: View {
    
    private var store : Store<MainState, MainAction>
    
    init(store : Store<MainState, MainAction>){
        self.store = store
    }
    
    struct ViewState : Equatable{
        var titleQuery : String
        var gitignoreStringQuery : String
        init(state : MainState){
            gitignoreStringQuery = state.gitignoreStringQuery
            titleQuery = state.titleQuery
        }
    }
    
    var body: some View {
        WithViewStore(self.store.scope(state: ViewState.init)){ viewStore in
            VStack {
                Text("Save your gitignore file", bundle: .module)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                TextField(
                    String(localized: "Please enter a title", bundle: .module),
                    text: viewStore.binding(
                        get: \.titleQuery,send: MainAction.titleQueryChanged
                    )
                ).textFieldStyle(gitignoreTextfieldStyle())
                .padding()
                
                TextEditor(text:viewStore.binding(
                    get: \.gitignoreStringQuery,send: MainAction.gitignoreStringQueryChanged
                ))
                .font(.title3)
                .padding([.leading,.trailing,.bottom])
                
                Spacer()
                HStack {
                    Button(String(localized: "Cancel", bundle: .module)) {
                        viewStore.send(.addSheetButtonDidTap)
                    }
                    Spacer()
                    Button(String(localized: "Create File", bundle: .module)) {
                        viewStore.send(.addSheetCreateFileButtonDidTap)
                    }
                    Button(String(localized: "Data Add", bundle: .module)) {
                        viewStore.send(.saveGitignoreButtonDidTap)
                    }
                }
            }
            .frame(width: 600, height: 400)
            .padding()
            .onAppear {
                viewStore.send(MainAction.addSheetonAppear)
            }
        }
    }
}
