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
                Text("Save your gitignore file")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                TextField(
                    "제목을 입력해주세요",
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
                    Button("Cancel") {
                        viewStore.send(.addSheetButtonDidTap)
                    }
                    Spacer()
                    Button("Create File") {
                        viewStore.send(.saveGitignoreButtonDidTap)
                    }
                    Button("Data Add") {
                        viewStore.send(.saveGitignoreButtonDidTap)
                    }
                }
            }
            
            .frame(width: 600, height: 400)
            .padding()
        }
    }
}
