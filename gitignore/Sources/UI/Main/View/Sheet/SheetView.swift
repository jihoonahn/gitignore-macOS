import SwiftUI
import ComposableArchitecture

struct SheetView: View {
    
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
                Text("Save your gitignore file")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                TextField(
                    "제목을 입력해주세요",
                    text: viewStore.binding(
                        get: \.titleQuery,send: MainAction.titleQueryChanged
                    )
                ).textFieldStyle(gitignoreTextfieldStyle())


                ScrollView(.vertical){
                    Text("야옹")
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame( height: 100)
                    
                Spacer()
                HStack {
                    Button("Cancel") {
                        
                    }
                    Spacer()
                    Button("Add") {
                        
                    }
                }
            }
            .frame(width: 300, height: 200)
            .padding()
        }
    }
}
