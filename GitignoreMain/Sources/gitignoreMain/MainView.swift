import SwiftUI
import ComposableArchitecture
import UIUtil
import gitignoreView

//MARK: - MainView
public struct MainView: View {
    
    let store : Store<MainState,MainAction>
    
    public init(store: Store<MainState, MainAction>) {
        self.store = store
    }
    
    struct ViewState : Equatable{
        var searchQuery : String
        var addSheetStatus : Bool
        var liststatus : Bool
        var userChooseTag : Set<String>
        
        init(state : MainState){
            searchQuery = state.searchQuery
            addSheetStatus = state.addSheetStatus
            liststatus = state.liststatus
            userChooseTag = state.userChooseTag
        }
    }
    
    public var body: some View {
        Color.backgroundColor
            .ignoresSafeArea()
            .padding(.leading,-10)
        
        WithViewStore(self.store.scope(state: ViewState.init)) { viewStore in
            VStack{
                HStack{
                    Spacer()
                    Button(action: {viewStore.send(.addSheetButtonDidTap)}, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    })
                    .sheet(isPresented: viewStore.binding(
                        get: \.addSheetStatus,send: MainAction.addSheetButtonDidTap)){
                            AddSheetView(store: store)
                    }
                    .padding(5)
                    .buttonStyle(ToolBarButtonStyle())
                }
                .padding()
                Spacer()
                VStack{
                    TitleLogo()
                    HStack{
                        TextField(
                            String(localized:"Search for operating systems, development environments (IDE), and programming languages",bundle: .module),
                            text: viewStore.binding(
                                get: \.searchQuery,send: MainAction.searchQueryChanged
                            ), onCommit: {
                                viewStore.send(MainAction.tapTagChoose(0))
                            }
                        )
                        .textFieldStyle(gitignoreTextfieldStyle())
                        .frame(width: 300)
                        Button(action: {
                            viewStore.send(.createGitignore)
                        }, label: {
                            Text("Create", bundle: .module)
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                        })
                        .buttonStyle(CreateButtonStyle())
                    }
                    .padding(.top,30)
                    TagMainView(store: store)
                        .frame(width: 360)
                        .fixedSize(horizontal: false, vertical: true)
                        .overlay(alignment: .topLeading) {
                            VStack{
                                if !viewStore.liststatus{
                                    SearchList(store: store)
                                        .frame(width: 300, height: 100 )
                                }
                            }
                        }
                }
                Spacer()
            }.onAppear {
                viewStore.send(.onAppear)
            }
        }.frame(maxWidth: .infinity , maxHeight: .infinity)
    }
}
